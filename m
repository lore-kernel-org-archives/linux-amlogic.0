From: narmstrong@baylibre.com (Neil Armstrong)
Date: Sat, 24 Mar 2018 14:41:38 +0100
Subject: [PATCHv2 0/3] dw-hdmi: add property to disable CEC
In-Reply-To: <CAFBinCA-x=4J_a_+oJX7fxhXO0qP=apEPFesATP=UNsH91qiCw@mail.gmail.com>
References: <20180323125915.13986-1-hverkuil@xs4all.nl>
 <CAFBinCA-x=4J_a_+oJX7fxhXO0qP=apEPFesATP=UNsH91qiCw@mail.gmail.com>
Message-ID: <3F857A55-296E-4AFF-8375-3165D0B3DAB4@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Martin,

> Le 24 mars 2018 ? 12:00, Martin Blumenstingl <martin.blumenstingl@googlemail.com> a ?crit :
> 
> Hello Hans, Hi Neil,
> 
> (apologies in advance if any of this is wrong, I don't have any CEC
> capable TV so I can't test it)
> 
> On Fri, Mar 23, 2018 at 1:59 PM, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>> From: Hans Verkuil <hans.verkuil@cisco.com>
>> 
>> Some boards (amlogic) have two CEC controllers: the DesignWare controller
>> and their own CEC controller (meson ao-cec).
> as far as I understand the Amlogic Meson SoCs have two domains:
> - AO (always-on, powered even in suspend mode) where meson-ao-cec can
> wake up the system from suspend
> - EE (everything else, not powered during suspend) where dw-hdmi-cec lives
> 

Exact, except ? the EE CEC is not hooked to the DW-HDMI TX but the RX, and thus cannot be used on GXBB/GXL/GXM.

> this far everything is OK
> 
>> Since the CEC line is not hooked up to the DW controller we need a way
>> to disable that controller. This patch series adds the cec-disable
>> property for that purpose.
> drivers/pinctrl/meson/pinctrl-meson-gxbb.c has ao_cec_pins and
> ee_cec_pins, both use GPIOAO_12
> drivers/pinctrl/meson/pinctrl-meson-gxl.c has ao_cec_pins and
> ee_cec_pins, both use GPIOAO_8
> 
> @Neil: do you know if the CEC signal routing is:
> ao_cec_pins -> meson-ao-cec
> ee_cec_pins -> dw-hdmi-cec

It?s hooked to the DW-HDMI RX IP used in the TV SoCs.

> 
> I'm curious because if both CEC controllers can be used then it might
> be worth mentioning this in the cover-letter and patch description
> 

Initially I thought it was hooked to the DW-HDMI TX, but no, I guess I should remove the ee_cec pinmux?

Neil

> 
> Regards
> Martin
