#!/usr/bin/env python
import os
import subprocess
import sys

from duckietown_challenges import wrap_solution, ChallengeSolution, ChallengeInterfaceSolution


class Solver(ChallengeSolution):
    def run(self, cis):
        assert isinstance(cis, ChallengeInterfaceSolution)
        cwd = '/aidamod/target'
        # cp = 'aidamod-1.4.7.jar'
        # fn = os.path.join(cwd, cp)
        # if not os.path.exists(fn):
        #    msg = 'Could not find the JAR file %s' % cp
        #    msg += '\nThese are the files in the dir "%s" : %s' % (cwd, list(os.listdir(cwd)))
        #    raise Exception(msg)
        #
        # cis.info('next showing the current directory.')
        # cis.info(os.getcwd())
        # dirlist = os.listdir(os.getcwd())
        # cis.info(dirlist)
        cis.info('showing java version:')
        cmdversion = ['java','-version']
        subprocess.check_call(cmdversion, cwd=cwd, stdout=sys.stdout, stderr=sys.stderr)
        # cmd = ['java', '-jar', 'aidamod-1.4.7.jar', 'aido-host']
        cmd = ['java', '-cp', '/amod/target/amod-1.6.7.jar',
               '-cp', '/aidamod/target/classes','aidamod.demo.AidoGuest', 'aido-host']

        cis.info('Now running %s' % cmd)

        subprocess.check_call(cmd, cwd=cwd, stdout=sys.stdout, stderr=sys.stderr)

        cis.set_solution_output_dict({})


if __name__ == '__main__':
    wrap_solution(Solver())
