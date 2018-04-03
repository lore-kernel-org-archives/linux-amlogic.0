From: sjg@chromium.org (Simon Glass)
Date: Wed, 4 Apr 2018 01:53:34 +0800
Subject: [PATCH v2 u-boot 1/2] reset: Add get/assert/deassert/release for
 bulk of reset signals
In-Reply-To: <1522748451-21209-2-git-send-email-narmstrong@baylibre.com>
References: <1522748451-21209-1-git-send-email-narmstrong@baylibre.com>
 <1522748451-21209-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <CAPnjgZ3curpxg443ZuQjmX2nAYkxMFq2SsYVpUJy4UFwx1Hcew@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 3 April 2018 at 17:40, Neil Armstrong <narmstrong@baylibre.com> wrote:
> This patch adds a "bulk" API to the reset API in order to get/deassert/
> assert/release a group of reset signals associated with a device.
>
> This bulk API will avoid adding a copy of the same code to manage
> a group of reset signals in drivers.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/reset/reset-uclass.c | 60 +++++++++++++++++++++++++++
>  include/reset.h              | 99 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 159 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
