#!/bin/bash

#mylr=0.3
#--lr $mylr
#nepoch=50
#mystep_size=1.25
#--step_size $mystep_size --adjoint_step_size $mystep_size 
#python3 GRAND.py --prox --prox_method bdf2 --epoch $nepoch --optimizer rmsprop --adjoint_method dopri5 --tol_scale 2.5 --adjoint_tol_scale 2.5
#python3 GRAND.py --prox --prox_method bdf3 --epoch $nepoch --optimizer rmsprop --adjoint_method dopri5 --tol_scale 2.5 --adjoint_tol_scale 2.5
#python3 GRAND.py --prox --prox_method bdf4 --epoch $nepoch --optimizer rmsprop --adjoint_method dopri5 --tol_scale 2.5 --adjoint_tol_scale 2.5
#python3 GRAND.py --prox --prox_method crank_nicolson --epoch $nepoch --optimizer rmsprop --adjoint_method dopri5 --tol_scale 2.5 --adjoint_tol_scale 2.5

## Cora dataset
#python3 GRAND.py --adjoint --dataset Cora --method dopri5 --adjoint_method dopri5 --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset Cora --method dopri8 --adjoint_method dopri8  --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset Cora --method adaptive_heun --adjoint_method adaptive_heun --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset Cora --method implicit_adams --adjoint_method implicit_adams --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset Cora --method dopri5 --adjoint_method dopri5 --block constant --function transformer
#python3 GRAND.py --adjoint --dataset Cora --method dopri8 --adjoint_method dopri8  --block constant --function transformer
#python3 GRAND.py --adjoint --dataset Cora --method adaptive_heun --adjoint_method adaptive_heun --block constant --function transformer
#python3 GRAND.py --adjoint --dataset Cora --method implicit_adams --adjoint_method implicit_adams --block constant --function transformer
python3 GRAND.py --adjoint --dataset Cora --block pnode --function mytransformer --imex --use_dlpack -ts_monitor -ts_trajectory_type memory

## CoauthorCS
#python3 GRAND.py --adjoint --dataset CoauthorCS --method dopri5 --adjoint_method dopri5 --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset CoauthorCS --method dopri8 --adjoint_method dopri8  --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset CoauthorCS --method adaptive_heun --adjoint_method adaptive_heun --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset CoauthorCS --method implicit_adams --adjoint_method implicit_adams --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset CoauthorCS --method dopri5 --adjoint_method dopri5 --block constant --function transformer
#python3 GRAND.py --adjoint --dataset CoauthorCS --method dopri8 --adjoint_method dopri8  --block constant --function transformer
#python3 GRAND.py --adjoint --dataset CoauthorCS --method adaptive_heun --adjoint_method adaptive_heun --block constant --function transformer
#python3 GRAND.py --adjoint --dataset CoauthorCS --method implicit_adams --adjoint_method implicit_adams --block constant --function transformer
python3 GRAND.py --adjoint --dataset CoauthorCS --block pnode --function mytransformer --imex --use_dlpack -ts_monitor -ts_trajectory_type memory

## Photo
#python3 GRAND.py --adjoint --dataset Photo --method dopri5 --adjoint_method dopri5 --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset Photo --method dopri8 --adjoint_method dopri8  --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset Photo --method adaptive_heun --adjoint_method adaptive_heun --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset Photo --method implicit_adams --adjoint_method implicit_adams --block attention --function laplacian
#python3 GRAND.py --adjoint --dataset Photo --method dopri5 --adjoint_method dopri5 --block constant --function transformer
#python3 GRAND.py --adjoint --dataset Photo --method dopri8 --adjoint_method dopri8  --block constant --function transformer
#python3 GRAND.py --adjoint --dataset Photo --method adaptive_heun --adjoint_method adaptive_heun --block constant --function transformer
#python3 GRAND.py --adjoint --dataset Photo --method implicit_adams --adjoint_method implicit_adams --block constant --function transformer
python3 GRAND.py --adjoint --dataset Photo --block pnode --function mytransformer --imex --use_dlpack -ts_monitor -ts_trajectory_type memory

