From: Jose.Abreu@synopsys.com (Jose Abreu)
Date: Fri, 3 Mar 2017 10:05:36 +0000
Subject: [PATCH v2 2/2] drm: bridge: Move HPD handling to PHY operations
In-Reply-To: <952185cf-16b8-b987-4737-96c2db4a0f6c@baylibre.com>
References: <1488468572-31971-1-git-send-email-narmstrong@baylibre.com>
 <1488468572-31971-3-git-send-email-narmstrong@baylibre.com>
 <6652377.Pu8amSWD8H@avalon>
 <952185cf-16b8-b987-4737-96c2db4a0f6c@baylibre.com>
Message-ID: <67b8ac3e-3227-8f32-7f20-0cd4b6d4510f@synopsys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Neil,


On 03-03-2017 09:07, Neil Armstrong wrote:
>
> The problem is that the HPD/RxSense is tied to this phy_mask and glued into the
> dw-hdmi driver.
>
> The *real* solution would be to completely separate the HPD/RxSense irq handling to
> a separate driver as a shared irq...
>
> If Jose is willing to give me some documentation and Freescale some boards, I'll be
> happy to do it !
>
>

Hmm, why don't get rid of phy_mask totally and just return the
new mask in update_hpd() function? Or add a get_hpd_status()
callback. (I also think there are too many callbacks. For example
we could have: setup, set_status, clear and then just use
parameters when needed:
    void setup(bool force, bool disabled, bool rxsense)
    void set_status(bool enable, bool enable_ints)
    void clear()

What do you think? I only checked quickly the code, don't know if
this is enough.

Best regards,
Jose Miguel Abreu
