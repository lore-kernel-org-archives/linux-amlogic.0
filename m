From: paul.gortmaker@windriver.com (Paul Gortmaker)
Date: Tue, 7 Feb 2017 19:18:43 -0500
Subject: [PATCH 0/4] reset: de-modularize the remaining reset drivers
Message-ID: <20170208001847.9887-1-paul.gortmaker@windriver.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Recently, a new reset driver was added that used module stuff in a
driver that was clearly non-modular[1].  With that in mind, it is
probably wise to get the remaining patches I have locally for the
existing reset drivers out the door, so we don't get any more
future instances of a new driver copying the old error once again.

Paul.

---

[1] https://lkml.kernel.org/r/CAP=VYLqhAEKAdnO7skBU7V+NxbQqXs_UbOO0J1hYHmCq3aKQow at mail.gmail.com

Cc: Alban Bedel <albeu@free.fr>
Cc: Carlo Caione <carlo@caione.org>
Cc: Damien Horsley <Damien.Horsley@imgtec.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic at lists.infradead.org
Cc: linux-oxnas at lists.tuxfamily.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>

Paul Gortmaker (4):
  reset: ath79: make it explicitly non-modular
  reset: pistachio: make it explicitly non-modular
  reset: meson: make it explicitly non-modular
  reset: oxnas: make it explicitly non-modular

 drivers/reset/reset-ath79.c     | 27 ++++++++-------------------
 drivers/reset/reset-meson.c     | 12 ++++--------
 drivers/reset/reset-oxnas.c     |  6 ++----
 drivers/reset/reset-pistachio.c |  9 ++-------
 4 files changed, 16 insertions(+), 38 deletions(-)

-- 
2.11.0
