Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F146C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 20:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXgpavqVawkgE7OejrjhqqzlT6/wyadfgrsNc41DVXk=; b=etLjJMBD3FYdvP
	RN5DktQJ5uw5RNfm6x/QJh9jiClh8Ps7yw8oVOupmFB/8UBRhFt9CbXSc8AO8rSxWccPUx7Jvp2l7
	QdLE+s6WHmtmVj6AmGjtdp5TlkTOjaxImNwmk9/tHNwBeZBTRv2SiZkrEzeYyAIQ6vvOrO8oBPgan
	gXZ1AKem8yoPr/3wCWF/RCdYQYsjhF2ramGYNoSL5RocnxF+X3DUOK1eGpJaiNdm8IcPuc1ZhlTvJ
	WHFHG7nkd3EebiTTvpTfijwNuc0qTudM8tdCjJqIv7Kz3mO2lqMSew83iKbcUygNNs0OjhzqqKDOZ
	gS1WjwG/UeM+EiVwdLZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMFHn-007BSy-20; Mon, 21 Feb 2022 20:27:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMFGq-007B3U-OT; Mon, 21 Feb 2022 20:26:58 +0000
Received: by mail-ed1-x531.google.com with SMTP id s14so14369019edw.0;
 Mon, 21 Feb 2022 12:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=6/CbbKb963ZeCrGB3DpHf3S/LmT0OSOkIfiP6ix0yNw=;
 b=CZ2cpSnJj/iYQkv+MnAaAe+Hi3/lKYxwLMWRl30vUsJBwPfghMR2i6Rw33lo63nd4L
 si7vTuHXPscr8e+B8mMHu+VGezXiWiq+inpaAqHLE368pE49xTWzhXVCcc/YAIYLEULK
 XDP6rnd1QriUbfHvlzSRzfXrOMY68uBsGfy20b3OEJkHS50VEJ00JWWGhS8Fm1120Wli
 UQjcl7l6ao+nrl/IWI88Eihp6WWAIEJvy8sPm9hZ3ZvJLYdMaQl6ALRjtT+HXSZWsMQt
 VZ0mTqFsM/wLO1aX4JjKvzC+j8jpE9mtrDpndGHuYRbGE0MnaQP3J9mcy4th4ql/0JiM
 PhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=6/CbbKb963ZeCrGB3DpHf3S/LmT0OSOkIfiP6ix0yNw=;
 b=I7JnBxrm9mbkhJ2mwIA3EXSDP0qkJiy6u4p+rTUOo5ECf5CUJNW4Ao8jpUW5BvdGS0
 Ymj1Sbk7lOWZcKlCacCU2dbq+SoADYAPQmBag2tnN5+Y+NACRiS9l16ht0clEmmofmlX
 vIv6znRmVcWKqoOTsE19vHUT1dQ8+jHc67pPUdE9A+QigbeW6an3IzSe5WG2NPDc7+Pm
 PmgBHcbXrOzTkdSakK7wZG61rTwGqOITSE26FmwDX3tD6cNc96cf/FnmYq+hu7WKzd0h
 at4If1uLELJEqUU7GyHqE5SuUWt0QMdGXnEHFoF6rYIPQN0j6f9R/W0tmhcn10o/JSyK
 GWtg==
X-Gm-Message-State: AOAM532X8CbxyfCW4h+4xiD4Dp05NXYFHg2mZCLiLzPhdyNIcSIclEGF
 FMq0SDeq6q3pHTMk+LY/qOQ=
X-Google-Smtp-Source: ABdhPJw5C8aS2uojppIF/KiB3IM1XbxzEZagKJMBWFLTCnt1ltvm5AtbsTjekE5NprGJ/F9a1Vpm7A==
X-Received: by 2002:a05:6402:2159:b0:410:8098:b6cd with SMTP id
 bq25-20020a056402215900b004108098b6cdmr22582027edb.429.1645475215609; 
 Mon, 21 Feb 2022 12:26:55 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:b141:a0d:4aad:2a06?
 (p200300ea8f4d2b00b1410a0d4aad2a06.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:b141:a0d:4aad:2a06])
 by smtp.googlemail.com with ESMTPSA id e1sm5475062ejy.103.2022.02.21.12.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:26:55 -0800 (PST)
Message-ID: <94ceeca1-3123-fc4b-8cc9-a86e9ad08863@gmail.com>
Date: Mon, 21 Feb 2022 21:24:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 4/6] docs: ABI: document tm1628 attribute display-text
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
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
In-Reply-To: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_122656_872601_70A3D25E 
X-CRM114-Status: GOOD (  10.90  )
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
