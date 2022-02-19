Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B92C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXgpavqVawkgE7OejrjhqqzlT6/wyadfgrsNc41DVXk=; b=AYAXvkghDwbawW
	Z8D3aazeOG7T2rSo5Myh1tv7F+ZqO9r92BNNuV9dqXdnOzW0kRCPAFaqjy0//rGf7PlwvcOBTkM2f
	F7E8A84mfBxri805lMx2hZLRGS/FWTI5iCvgwVUJkOxa9qmts8ZoTuPWAzrycSoSz1oFOyduaLxev
	752bBMebTHRybVKZa9uFINIot1ydpOZUB4Xzx332RH8ikKvOpKKiVVZKI9zLIY80TguWpQFZj6DUm
	0drXCBBEhWTQWz9v5/tBmZteftbr38Qnd6ATHKPO1FH4GKkPW+fC0wOpKhaNSP13Ww0cpD/GyL2EU
	eLiWrueS/zQnS2svIM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLPgx-00Gwuh-AL; Sat, 19 Feb 2022 13:22:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLPg9-00GwZq-0a; Sat, 19 Feb 2022 13:21:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id qx21so21408304ejb.13;
 Sat, 19 Feb 2022 05:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=6/CbbKb963ZeCrGB3DpHf3S/LmT0OSOkIfiP6ix0yNw=;
 b=g8yJlYskzqTuBRAAEoQM+HWpp7cbLRi4aY04uw1k85i8g9VrN7PveuKbxE0xjXz4W4
 0m8evUE7XQDbQU2cJ/aNI445xwopOp7kGMWScIfUk9veu3ArqpGJ4skEVEV4M7czBpdJ
 HZVLz0XIreUBuFamppgdxrnMECREn1Nw2b8TeOcc6WmwgnmdWYPKlTb3nW3w778z+FrG
 1wMKa7bVwyw8ke4zopRSHWr4XCEV+19sHsOqDY7CBrIwTFReTdSdG/TvSVYJ4AshYgsA
 t9HyUZi+py5V9U9rKO8qcYoy/lHN8XeJsoLit22RP2uMU4w+jnswk+NZysuVCJ7NNVLn
 cj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=6/CbbKb963ZeCrGB3DpHf3S/LmT0OSOkIfiP6ix0yNw=;
 b=LWOrskuWU7pqH78EoWvhv27QHz+zgaJi3T55GMU4H/tuKLwQm6jNbEzF3YrDuDDK1P
 FwVQ3nfjWigUi6J2Igx0hgEwT8teE+Hxz631CCnSycmfb2CuF8d1ssRufUMS1zvPx4nD
 Ht4HzOjFZrFOqMr5egQMx0NPMtrP8hLXYT8BtX7YQTIFwvuVzuDrtb7HJ25TNKZ+air4
 3HE8BP1W6oGZKt6cR4EJg39fnKKaaPRpqcreEXF5dyO7+oL1/0ya5UXlrm6IEVtn8q0c
 Nf8y0T2JJsIrj9ij2R9EabnGQ6dOMsM/ZRlZ4cXIURAGvI5MCUVdLbx6R+QORHJPydUJ
 n80g==
X-Gm-Message-State: AOAM5314SHfEG9prTy/2g5Zg7K5nUyjSIvDzN1B3KEP2MT18VttWxfFE
 QRoQYsUmH+05W9IiEUwT0fI=
X-Google-Smtp-Source: ABdhPJzhAyytukio3fsv22UT9/mGIL0fYpo82E0oO6KLYaHugboccaHhai7rq9lexRYpVBewgQTSaA==
X-Received: by 2002:a17:906:6b8e:b0:6cd:7d22:e5b6 with SMTP id
 l14-20020a1709066b8e00b006cd7d22e5b6mr10437171ejr.259.1645276895195; 
 Sat, 19 Feb 2022 05:21:35 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d?
 (p200300ea8f4d2b005cf9df09c1b3d44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d])
 by smtp.googlemail.com with ESMTPSA id p9sm3272675ejn.104.2022.02.19.05.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 05:21:34 -0800 (PST)
Message-ID: <ab21016c-503b-9ccf-6d64-07d25ac0a13f@gmail.com>
Date: Sat, 19 Feb 2022 14:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 4/6] docs: ABI: document tm1628 attribute display-text
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
In-Reply-To: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_052137_081344_A940CCF7 
X-CRM114-Status: GOOD (  11.08  )
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

Document the attribute for reading / writing the text to be displayed on
the 7 segment display.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 Documentation/ABI/testing/sysfs-devices-auxdisplay-tm1628 | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-auxdisplay-tm1628

diff --git a/Documentation/ABI/testing/sysfs-devices-auxdisplay-tm1628 b/Documentation/ABI/testing/sysfs-devices-auxdisplay-tm1628
new file mode 100644
index 000000000..382757e72
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-auxdisplay-tm1628
@@ -0,0 +1,7 @@
+What:		/sys/devices/.../display-text
+Date:		February 2022
+Contact:	Heiner Kallweit <hkallweit1@gmail.com>
+Description:
+		The text to be displayed on the 7 segment display.
+		Any printable character is allowed as input, but some
+		can not be displayed in a readable way with 7 segments.
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
