Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107B6C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btZn9h1NgBo7HOgwlguGJ1FPxoneOev5enQF1IPEJAs=; b=GsX5liMJGqMsvj
	Nk8/16NrpUYNPcNfmRcrfDl00ZvWkj3BtOYmXZw/DdIpDIXwzaeuhslbmVXeyrTbhui2NA9Eyr05R
	s2iBXTLF/pKBl+yxLiJKZXKZNIGdUb19ewK6uY5aOAHGvHdbk3mC+m3fJDCX4A/+sIpyqQ93ePTPk
	5+BcUJPJS3iOuhDbiId9iRcpTyYeWVK7/IcfGveB3nCC4ZWYW0+LNavfoxkFcuFbipN98VUHIRinx
	wkxJOJwOhxv5Kzu6gbRyuV35dIGZHBp7o5p4IVtRGfYUKHpzvBzFaZNNnJFbW8HhZo3D9Ty6NU1yX
	ckumLwD4PwuzZjAY6c/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKSz-002Hqs-J6; Thu, 24 Feb 2022 20:11:57 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKSa-002HiQ-Dp; Thu, 24 Feb 2022 20:11:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id a23so6690701eju.3;
 Thu, 24 Feb 2022 12:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=UVQe4QpHFzuLZpN6vaQunZm/CaPTqOiqz/VUjJgbjIY=;
 b=m4GtAAGYO3BkIqRQzP7hsZcEyNeuyay3Jjo2z6wAqy8pzAlVvAWp/C010rUQJkb2bi
 je2GEOSuEPP9mc5TmrhyLEvNDelV/sql9bY2VPq5UPxFGP0PVTm9tlfWzZt8K70PajHT
 MnhbShrEp6d0xPUmQRBKBh1IK1Bqj4jqYTogPPzwl38IUzImWXvJlzs2vOOTd74RizAr
 NA6xSilGzlsaehEHCaPYpvSNs6fjGZa92kvg5nrGua0cSErkd5vC48RvHfteVRZMGQfy
 x2U0suYB2cpM+diRvAB3KGqJpJXFODFG46Op6NnicHkFHoHXwu22LKAzo433HMYFkhqS
 FspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=UVQe4QpHFzuLZpN6vaQunZm/CaPTqOiqz/VUjJgbjIY=;
 b=ehgNv0C306tXfaIlbw5nQz/dkC5O4KLJ3ALSQXP7iZISjWxAkAc9JaL8UDTnbLhagK
 crk7yZh7hL0/kaG5I1wR4Eef7YZSUOmcs8aslJd/wmQ/dOOOyLmvNhMxa1dS62cu6u8v
 BAC1dIuWSgqQsqhEpRbukI4iAInJglFW0qprIGGuyPJBrnegMySLNDDAFRA13wqVKxRL
 AgFuKTEnYY3EZa9orFzJyJc0nrGFn6/eypS4LPAwEM3YarfWqKQHIc0+Qsrr8cGDW7Fy
 Ye+LGOhfMby2zpCLFAGctN30p1EZK/YmAODix+Gku2zJclJisvGoXnnsqq/+B98Wj1Rr
 cAxg==
X-Gm-Message-State: AOAM533ZpaxtqB2sO1C2VeKd1388YmxYILOkssrZNXgTwjlFWm/m0WpR
 cvL+9a3Nk8y0W/lfH/PXHEw=
X-Google-Smtp-Source: ABdhPJzObB3m8DZuDRS0hvPr1rvD8F041xotEfnMfzcSRpVuPmAYDkbJiI09GZqa/CJQgIuCX6towA==
X-Received: by 2002:a17:906:7e52:b0:6ce:b94d:a97d with SMTP id
 z18-20020a1709067e5200b006ceb94da97dmr3672271ejr.4.1645733490776; 
 Thu, 24 Feb 2022 12:11:30 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd?
 (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
 by smtp.googlemail.com with ESMTPSA id
 j18-20020a50d012000000b0040e3ea64d4asm264262edf.31.2022.02.24.12.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:11:30 -0800 (PST)
Message-ID: <21a84254-ae31-3f4f-e1cf-5bd53043e64a@gmail.com>
Date: Thu, 24 Feb 2022 21:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v4 3/6] docs: ABI: document tm1628 attribute display_text
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
In-Reply-To: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_121132_493430_44D34569 
X-CRM114-Status: GOOD (  10.17  )
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
+What:		/sys/devices/.../display_text
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
