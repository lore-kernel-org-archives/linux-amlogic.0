From: jagan@amarulasolutions.com (Jagan Teki)
Date: Wed, 14 Nov 2018 18:39:37 +0530
Subject: [U-Boot] [PATCH u-boot v3 1/3] regmap: add
 regmap_read_poll_timeout() helper
In-Reply-To: <20181114102520.25346-2-narmstrong@baylibre.com>
References: <20181114102520.25346-1-narmstrong@baylibre.com>
 <20181114102520.25346-2-narmstrong@baylibre.com>
Message-ID: <CAMty3ZDTgBS0ABodPTrPxW7rmmXOV+nCE2_VKL7d8LakFs5E-Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Nov 14, 2018 at 3:57 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the regmap_read_poll_timeout() macro based on the Linux implementation
> to simplify register polling with configurable timeout and sleep.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Acked-by: Jagan Teki <jagan@openedev.com>
