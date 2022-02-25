Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5E0C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 21:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btZn9h1NgBo7HOgwlguGJ1FPxoneOev5enQF1IPEJAs=; b=tzcwSXjeiUUsDJ
	UTUWohizgimIDRo91qRGw93+aAxQPhV9mHXIKDzKnQMdZDgm2CntmtWINFjcW97IIAGR707E2UTtR
	mX16bY1lN2DDYBSH36Phu1C8yUE71f9u1c8zWgprvcOJ9ST6oGwJJ2ZVV1aWlllW8DyKISj1tvgRe
	Uol9Xbdety3MJ2zTW/QpnG7zJLHzIyIftnIO4A69UtuIiAUESoeloCrRb88rcEwzMplCu+VyDvVw7
	Dpjh7oCHzpR3mXyWQ+lFNFUsKcsh4d5hHryr1KXmU80VNCDOwYafAk5GibJmSDQywI8fHfTDL3OfD
	lV5//ZhxW1h7u2wHIAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNi4j-0070fo-Lg; Fri, 25 Feb 2022 21:24:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNi47-0070RC-EK; Fri, 25 Feb 2022 21:23:52 +0000
Received: by mail-ed1-x529.google.com with SMTP id h15so9139520edv.7;
 Fri, 25 Feb 2022 13:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=UVQe4QpHFzuLZpN6vaQunZm/CaPTqOiqz/VUjJgbjIY=;
 b=kaIHl/LJkdJS1GsMcUT8EPAy28bkiKpgVIuR7Ckd8pBLs7N9Ps7oK7Zg1IABnceVjk
 wBVwWlmP0ZVa5tEQxlnKMN2IheP35af6KLq3O6YncNLr4b4/IHOSoe4gjuPwPjuro4+x
 ty1cGK+HJD5urjdLI0xAj8st0OE7QYNHU6cZlnKhM6lGkSib5SB+H5YoTKPPpZMpUmJR
 QJKTxYYU9d0F0jV4rNTkD7ctoPZMpvNWn/NrXqcsA80NcwFy8yFfL9rz5seMq7Z3HayK
 nPLsP86VzXFoYFrFHYY2bIrYByBu+upgFFSezqO3RptCToX2Qa+oV635kPJbr/F0wyc3
 8JnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=UVQe4QpHFzuLZpN6vaQunZm/CaPTqOiqz/VUjJgbjIY=;
 b=72QQZfSmMRd9Yzov1o4d/IsdX+k1m4C6FGA1cTeTjS3PcGxhecA0YB6mZUO2cEeOuF
 eKrAGbkEuS6vK7m3y759cmP65Kd19iPR3VJCDwrPNI02MEuD1+Hk+Sl8FuXJqdUe9LU+
 9ckex6+6LmZ8NRhF+ErlfXbCJWzaMydJn/E85ayiUmh8/auEBQmEXJTXXZIGyKkFby/6
 c8DRVLseUxC11TyeESy2ucnZv44sv6dcS1yHMQs2Ku4PJhNMV8xNGBVa9EtV1rxCkQyD
 TwLnAokT/pscUfZXgSCI8mQhVFoQHSt9Er975nubeizxz/EFkOXufYNTskti90Z7vbPH
 tBzA==
X-Gm-Message-State: AOAM531E13Zyh7K4EbABJHLdh6umzLNi2PvD8G8tGvD6Mt/ulYne7XQJ
 24+PPKr3/AKpY85QgciCQWs=
X-Google-Smtp-Source: ABdhPJzVIlBCczq4S+kTfnqXgmTqkiY8UrCJ1lwdNVQJ0089sdMxaAY8UWYBfi5xnmZiKwi563Lnhg==
X-Received: by 2002:a05:6402:1148:b0:413:11e0:1f58 with SMTP id
 g8-20020a056402114800b0041311e01f58mr9009941edw.113.1645824229928; 
 Fri, 25 Feb 2022 13:23:49 -0800 (PST)
Received: from ?IPV6:2a01:c22:7326:e100:c9d3:3c62:2c99:d44b?
 (dynamic-2a01-0c22-7326-e100-c9d3-3c62-2c99-d44b.c22.pool.telefonica.de.
 [2a01:c22:7326:e100:c9d3:3c62:2c99:d44b])
 by smtp.googlemail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm1435030ejc.161.2022.02.25.13.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:23:49 -0800 (PST)
Message-ID: <95c57066-82b4-1c32-4324-77f9a79451c0@gmail.com>
Date: Fri, 25 Feb 2022 22:16:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v5 3/6] docs: ABI: document tm1628 attribute display_text
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
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
In-Reply-To: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_132351_537568_65CD51FD 
X-CRM114-Status: GOOD (  10.28  )
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
