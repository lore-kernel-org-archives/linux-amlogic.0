From: sjg@chromium.org (Simon Glass)
Date: Thu, 2 Aug 2018 14:36:08 -0600
Subject: [PATCH u-boot 1/2] power: domain: Add the VPU Power Domain driver
In-Reply-To: <1532613244-4585-2-git-send-email-narmstrong@baylibre.com>
References: <1532613244-4585-1-git-send-email-narmstrong@baylibre.com>
 <1532613244-4585-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ0OfdRkkoFCQChiUoYHSoG7agJEPMfeOWVSr-D04_jNiw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,

On 26 July 2018 at 07:54, Neil Armstrong <narmstrong@baylibre.com> wrote:
> The Amlogic Meson SoCs embeds a specific Power Domain dedicated to the
> Video Processing Unit.
> This patch implements support for this power domain in preparation of the
> future support for the Video display support in U-Boot.
>
> This driver will depend on changes in the clock driver to handle the setup
> of the VPU and VAPB clocks configured from DT using assigned-clocks entries.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/power/domain/Kconfig             |   7 ++
>  drivers/power/domain/Makefile            |   1 +
>  drivers/power/domain/meson-gx-pwrc-vpu.c | 198 +++++++++++++++++++++++++++++++
>  3 files changed, 206 insertions(+)
>  create mode 100644 drivers/power/domain/meson-gx-pwrc-vpu.c
>

Reviewed-by: Simon Glass <sjg@chromium.org>

Are the delays documented in a datasheet? I suggest adding a comment
about them. People will otherwise forever wonder how the values were
chosen.

Also it seems odd that you can't power everything up at once.

Regards,
Simon
