import torch
from torch import nn
from torch_geometric.utils import softmax
import torch_sparse
from torch_geometric.utils.loop import add_remaining_self_loops
import numpy as np
from data import get_dataset
from utils import MaxNFEException, squareplus
from base_classes import ODEFunc

class ODEFuncIM(nn.Module):
   
    def __init__(self):
        super(ODEFuncIM, self).__init__()
        self.A = nn.Identity()
        self.nfe = 0
 
    def forward(self, t, y):
        self.nfe += 1
        return -self.A(y)


class ODEFuncEX(nn.Module):
    def __init__(self, input_size=64, hidden=200):
        super(ODEFuncEX, self).__init__()
        self.input_size = input_size
        self.hidden = hidden
        self.F = nn.Sequential(
            nn.Linear(self.input_size, self.hidden, bias=False),
            nn.Sigmoid(),
            nn.Linear(self.hidden, self.hidden, bias=False),
            nn.Sigmoid(),
            nn.Linear(self.hidden, self.hidden, bias=False),
            nn.Sigmoid(),
            nn.Linear(self.hidden, self.input_size, bias=False),
        )
        for m in self.F.modules():
            if isinstance(m, nn.Linear):
                nn.init.normal_(m.weight, mean=0.00, std=0.01)
        self.nfe = 0

    def forward(self, t, y):
        self.nfe += 1
        return self.F(y) * y 


class IMEXFunc(ODEFunc):
  def __init__(self, in_features, out_features, opt, data, device):
    super(IMEXFunc, self).__init__(opt, data, device)
    self.funcEX = ODEFuncEX(in_features,opt['hidden_dim'])
    self.funcIM = ODEFuncIM()
  
  def forward(self, t, x):  # t is needed when called by the integrator
    if self.nfe > self.opt["max_nfe"]:
      raise MaxNFEException

    self.nfe += 1
    #import pdb;pdb.set_trace()
    f = self.funcEX(t,x) + self.funcIM(t,x)
    return f





#if __name__ == '__main__':
#  device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
#  opt = {'dataset': 'Cora', 'self_loop_weight': 1, 'leaky_relu_slope': 0.2, 'heads': 2, 'K': 10,
#         'attention_norm_idx': 0, 'add_source': False,
#         'alpha_dim': 'sc', 'beta_dim': 'sc', 'max_nfe': 1000, 'mix_features': False
#         }
#  dataset = get_dataset(opt, '../data', False)
#  t = 1
#  func = HeavyBallNODEFunc(dataset.data.num_features, 6, opt, dataset.data, device)
#  out = func(t, dataset.data.x)