from function_transformer_attention import ODEFuncTransformerAtt
from function_GAT_attention import ODEFuncAtt
from function_laplacian_diffusion import LaplacianODEFunc
from block_transformer_attention import AttODEblock
from block_constant import ConstantODEblock
from block_mixed import MixedODEblock
from block_transformer_hard_attention import HardAttODEblock
from block_transformer_rewiring import RewireAttODEblock

from function_hbnode import HeavyBallNODEFunc
from block_heavyball import HBNODEblock
from block_pnode import PNODEblock

class BlockNotDefined(Exception):
  pass

class FunctionNotDefined(Exception):
  pass

#ODEblock is to help integrating a RHS function. It is just an integrator block
def set_block(opt):
  ode_str = opt['block']
  if ode_str == 'mixed':
    block = MixedODEblock
  elif ode_str == 'attention':
    block = AttODEblock
  elif ode_str == 'hard_attention':
    block = HardAttODEblock
  elif ode_str == 'rewire_attention':
    block = RewireAttODEblock
  elif ode_str == 'constant':
    block = ConstantODEblock
  elif ode_str == 'heavyball':
    block = HBNODEblock
  elif ode_str == 'pnode':
    block = PNODEblock
  else:
    raise BlockNotDefined
  return block

#Options for the RHS functions for an ODE, which are implimented with the ODE equation/dynamics
def set_function(opt):
  ode_str = opt['function']
  if ode_str == 'laplacian':
    f = LaplacianODEFunc
  elif ode_str == 'GAT':
    f = ODEFuncAtt
  elif ode_str == 'transformer':
    f = ODEFuncTransformerAtt
  elif ode_str == 'hbnode':
    f = HeavyBallNODEFunc
  else:
    raise FunctionNotDefined
  return f
