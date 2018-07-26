From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 26 Jul 2018 14:45:41 +0200
Subject: [PATCH 0/3] ASoC: meson-axg: fifo and card fixup
Message-ID: <20180726124544.14740-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The purpose of this patchset is to solve the problems which have
been raised since the initial axg sound support has been accepted.

Jerome Brunet (3):
  ASoC: meson: use IRQ_RETVAL in the fifo irq handler
  ASoC: meson: update axg sound card bindings
  ASoC: meson: align axg card driver with DT bindings documentation

 .../bindings/sound/amlogic,axg-sound-card.txt | 68 +++++++++----------
 sound/soc/meson/axg-card.c                    | 12 ++--
 sound/soc/meson/axg-fifo.c                    |  2 +-
 3 files changed, 41 insertions(+), 41 deletions(-)

-- 
2.17.1
