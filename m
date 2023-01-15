Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DB0C3DA78
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 14:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g9iS45kP3JoV+77puKUKyTV4XkGc1n3ZZdEwVVQQ01k=; b=gSj0Yzk7y9XjO1
	NMpj4Smqp5v3GVPz4T7zz1aoMOGVz1rwVgOte7pzOxEoJQNfD/kYX3QggYJ1jHiuBgb3tXIihzC7a
	x+Fxmsoa27LUGHtmVHGBYyb67+Zj5nxpod5BhPwwK9/6vkmHi0XbHLIJeIl2QoOweK9kMAPJsXhHp
	BWyzDz1nlU3JX6GTeJ+yKOacyXKPjY2Yui5QO25UxdXvmAz7b+D9VZjh4/UTCPt56UKpeAeBsJzbE
	8pckZ1hAGKMKV50ezH93AuMq0kXKrqXZYyhMH9QesDMT93UE4zqmSHAxWDSp6KDU19noKw0RfkObN
	f8xhN02NMGu71NONBKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH3yG-007RsU-GD; Sun, 15 Jan 2023 14:26:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH3yD-007Rrc-3L; Sun, 15 Jan 2023 14:26:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id h12-20020a05600c314c00b003da50afcb33so1933725wmo.4;
        Sun, 15 Jan 2023 06:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLQqIynPN/pT84DVC6KpLTcAe3g0Vq4uxVa23539u9M=;
        b=ph6j2mV9QtgYB6RYOHt0jIk9j6j356U1Udxk0D99bRzeOov1hAGE5IUENdM5GP08Ka
         aA5uU0oWMt6emYkwafpPsQxym6jcIdla1CNLtQ9g/NS/Zatv5quYWg9P2HhwZ+v/KzxS
         wsNhbSExgHU9TaxwR8obmxiMX9xUcAlZKQV6qQ7Ossb0j8zmiy3fV4kg2SWdr8hS7QLb
         4NoT8GBCPo945w879fsghNCHN1G0+iIc6qFO4MFiRtky7+ybmh4zR8b6Eapze4b4lGoe
         51agl28rndt4OvlQVNO0STz/i7J2jZTfYVN3yQbVUXuryxmGRZOs3wu8tGSpkAb97hY/
         +jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TLQqIynPN/pT84DVC6KpLTcAe3g0Vq4uxVa23539u9M=;
        b=TIEKK47JY/iQ6ggConHLsb604QcecY/W7f1GUHqPVGjhz/ldHgrVpq08Qu6zbzPzqd
         X8oTGOg7J7OvibH8TIP1FV7rKC8zEOiT3Mgl96HYUYVTH19kuj6F6Fs+Vi6tyx/uwtOM
         ybg9JOHbOgt/hCzc8nOM7yoLUQXz0l+zGah1HPNzc0Kd0tgcBFfcrQQvAvPXERwvfTIb
         LXbRK45Necp+NUjiSl67ovrpsTG7hrtyKUCEcrZRnLOsENnO+/x0XRPKaYaAn/GnbIct
         PbNaE/xa0aM7Uq+09H3s4TEUA/3v1fMBGLqBQl7ABTaOLjRezpviJTkj7notw02xEcop
         oLkw==
X-Gm-Message-State: AFqh2koK0ddySqIjVnLv7FoDEDyJ1dgf2LuO9cSQa0+2qJ0gZ/Nx64AS
	cp1GMeoAF7ig0NholxdSx1Y=
X-Google-Smtp-Source: AMrXdXvw3m1Dacl6ZKOHdwKsCCaEN4Is2WYBhyseFfVSsp4ym8yGFjQiyNwImcowiwaeIZQely1wRQ==
X-Received: by 2002:a05:600c:1f08:b0:3d1:bf7c:391c with SMTP id bd8-20020a05600c1f0800b003d1bf7c391cmr5527248wmb.4.1673792807423;
        Sun, 15 Jan 2023 06:26:47 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id ay15-20020a05600c1e0f00b003dab77aa911sm4043801wmb.23.2023.01.15.06.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:26:47 -0800 (PST)
Message-ID: <38f87b22-d9a8-b8d8-ba7b-a2c2d7311b04@gmail.com>
Date: Sun, 15 Jan 2023 15:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH resend] MAINTAINERS: add PHY-related files to Amlogic SoC file
 list
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Language: en-US
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_062649_151517_B8F840D7 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add PHY-related files to the Amlogic SoC file list.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c83c26e9..428d88195 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1909,10 +1909,12 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 W:	http://linux-meson.com/
+F:	Documentation/devicetree/bindings/phy/amlogic*
 F:	arch/arm/boot/dts/meson*
 F:	arch/arm/mach-meson/
 F:	arch/arm64/boot/dts/amlogic/
 F:	drivers/mmc/host/meson*
+F:	drivers/phy/amlogic/
 F:	drivers/pinctrl/meson/
 F:	drivers/rtc/rtc-meson*
 F:	drivers/soc/amlogic/
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
