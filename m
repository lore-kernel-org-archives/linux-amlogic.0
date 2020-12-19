Return-Path: <SRS0=kh+7=FX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA7AC4361B
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 18:41:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C53D2336F
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 18:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C53D2336F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oYACGUIaAGUDnCFktIjzYIEztmBnDTRsKaxGQMHawuE=; b=cYsT76F6hp47NG8AjkJUau8i0
	FYLXrhuvz5QU3+6dJiRwdDpZtPdChgmCkMSpPRpBVhghEzYxRVe+qNoMEg3y1HqRRrLkFiqDLYayn
	FGPSPsfhVIU2LyddMPsJwWk+9+9EZmBcBWu5su15+N9TTFpz+J2wsdTpcKEbZWozupyYkKPpRSjki
	8Pt0Yw/GdZemJCUjDr3uHXcSogYlzH8o1L0lIWYg7Xbwp4x3TfMQqf1i3I5ZiY0LoxwvrsuP2XK0S
	SurJ4+65y4XRqbomyS+lv9Njq5IMNBMNBejpqX9t6USw4WFHqYAtepDbDEImoryUOhDbYbbWMkTHT
	+fhf5esWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqhAk-0001wY-2o; Sat, 19 Dec 2020 18:41:42 +0000
Received: from dd10532.kasserver.com ([85.13.133.80])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqhAg-0001vy-An
 for linux-amlogic@lists.infradead.org; Sat, 19 Dec 2020 18:41:39 +0000
Received: from odsus.home.arpa
 (dslb-002-204-168-073.002.204.pools.vodafone-ip.de [2.204.168.73])
 by dd10532.kasserver.com (Postfix) with ESMTPSA id 2EC731F42B26;
 Sat, 19 Dec 2020 19:41:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by odsus.home.arpa (Postfix) with ESMTP id 9CFA33D671;
 Sat, 19 Dec 2020 19:41:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at home.arpa
Received: from odsus.home.arpa ([127.0.0.1])
 by localhost (odsus.home.arpa [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q-BcfQOwSYD5; Sat, 19 Dec 2020 19:41:29 +0100 (CET)
Received: from [192.168.20.240] (r64.home.arpa [192.168.20.240])
 by odsus.home.arpa (Postfix) with ESMTP id A3E673D66F;
 Sat, 19 Dec 2020 19:41:29 +0100 (CET)
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
 <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
 <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
 <CAFBinCD6aqna6YYvXgO5iKWa9N3yvqehhB+SAirLaUu3xScy2Q@mail.gmail.com>
 <bd9d96d2-8b66-db93-a855-5e179adca8c9@gmx.net>
 <0d05671d-b5f4-55e4-f5bd-58410cc92d08@baylibre.com>
 <dd160e55-55e9-1c41-afcb-22990a05a86b@gmx.net>
 <CAFBinCDv+TgEgf1g7xBTknr-aJMhC3K1wOW87-06YG4sQ9wUAg@mail.gmail.com>
 <531138bc-d343-1081-d208-ab6c98c1ddd8@gmx.net>
 <CAFBinCBoWGV02hF=0DK_geLpArDtm-qbAKCrXQitpb33UU_zYA@mail.gmail.com>
From: Otto Meier <gf435@gmx.net>
Message-ID: <0cef2d79-4f15-72c6-1308-d29eca9e49cc@gmx.net>
Date: Sat, 19 Dec 2020 19:41:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBoWGV02hF=0DK_geLpArDtm-qbAKCrXQitpb33UU_zYA@mail.gmail.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_134138_517748_8F4A94E8 
X-CRM114-Status: GOOD (  29.86  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, u-boot-amlogic@groups.io,
 U-Boot Mailing List <u-boot@lists.denx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

Am 19.12.20 um 14:58 schrieb Martin Blumenstingl:
> Hi Otto,
>
> On Mon, Dec 14, 2020 at 8:34 PM Otto Meier <gf435@gmx.net> wrote:
>> Hi Martin,
>>
>> Am 13.12.20 um 19:46 schrieb Martin Blumenstingl:
>>> Hi Otto,
>>>
>>> On Mon, Dec 7, 2020 at 1:43 PM Otto Meier <gf435@gmx.net> wrote:
>>> [...]
>>>>>> So with the latest u-boot and the kernel from https://github.com/chewitt/linux/tree/amlogic-5.10.y
>>>>>> commit 725fc8df7898102f9031ba2075f763884ffa3ee8 everything is working again.
>>>>>> USB does hotplugging as expected.
>>>>> So, this fixes USB under Linux ?? It's not clear
>>> if you have time it would be great if you could figure out which of
>>> the patches from Christian's tree fixes USB hotplugging for you.
>>> Or is it fixed in Linux 5.10-rcX even without any patches?
>>>
>> The new mainline kernel 5.10.0 from Linus, without any other patches
>> does detect USB hotpluging,
>> when using u-boot DMI: Hardkernel Co., Ltd. ODROID-C2/ODROID-C2, BIOS
>> 2021.01-rc3-00039-gec79f5ce22-dirty 12/08/2020
>> and the following u-boot patch:
> [...]
>> When i use the last unpatched emmc bootable u-boot 2020.04 the kernel
>> boots, but usb hotplugging
>> does not work.
> Thank you for testing this!
>
>> Hope this describes my findings. If i can help further, please give me a
>> note.
> to be honest: I am a bit lost here. I don't understand how the BOOT_*
> pins interfere with USB.
> I also don't have any Odroid-C2 board myself so I cannot do any
> experiments myself.
> Neil, please let me know if you have any idea here.
The latest Patch from Neil in U-boot also
fixes all the problems:

This fixes the wrong usage of clrsetbits_le32(), badly setting the set argument.

Fixes: c4c726c26b ("pinctrl: meson: add pinconf support")
Reported-by: Anton Arapov<arapov@gmail.com>
Reported-by: Otto Meier<gf435@gmx.net>
Signed-off-by: Neil Armstrong<narmstrong@baylibre.com>
---
Hi Anton, Otto,

This should fix eMMC booting on Odroid-C2, could you have a quick try to confirm ?

Thanks,
Neil

  drivers/pinctrl/meson/pinctrl-meson.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index d4539b02d8..5065b62436 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -216,13 +216,13 @@ static int meson_pinconf_bias_set(struct udevice *dev, unsigned int pin,
         }

         /* othewise, enable the bias and select level */
-       clrsetbits_le32(priv->reg_pullen + reg, BIT(bit), 1);
+       clrsetbits_le32(priv->reg_pullen + reg, BIT(bit), BIT(bit));
         ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_PULL, &reg, &bit);
         if (ret)
                 return ret;

         clrsetbits_le32(priv->reg_pull + reg, BIT(bit),
-                       param == PIN_CONFIG_BIAS_PULL_UP);
+                       (param == PIN_CONFIG_BIAS_PULL_UP ? BIT(bit) : 0));

         return 0;
  }
--
2.25.1

perhaps this gives an idea of what was wrong.
But anyhow for me the issues with U-boot and usb hotplug is solved so far.
For me this is even more i understand.


>
> Best regards,
> Martin
>
Thanks for your help.

Otto

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
