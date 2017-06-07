From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed,  7 Jun 2017 15:30:11 +0200
Subject: [PATCH 0/2] pwm: add pwm AO on meson gx
Message-ID: <20170607133013.4766-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The pwms found in the AO domain of the meson gx family have different
clock sources than the one found in the EE domain. The AO pwms have only
2 connected clock input which are clk81 and the crytal.

This patchset adds the necessary compatible and the clock data for it.

Jerome Brunet (2):
  dt-bindings: pwm: meson: add comptabible for gxbb ao pwms
  pwm: meson: add compatible for the gxbb ao pwms

 .../devicetree/bindings/pwm/pwm-meson.txt          |  4 ++-
 drivers/pwm/pwm-meson.c                            | 32 ++++++++++++++++++++--
 2 files changed, 32 insertions(+), 4 deletions(-)

-- 
2.9.4
