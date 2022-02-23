Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11967C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXgpavqVawkgE7OejrjhqqzlT6/wyadfgrsNc41DVXk=; b=bds1BzUoOKEFRA
	/vLayByUqtBjSxAVwsI3nQl/Ih2Rkvng18tku7HZlytzrjwl9rzTvGJ690gskdux3aad7qacmDUba
	O0RgCeXWDogfcjyRlpCKvof6OGJMd3pZaWTCX2X1aG/CqVZkPTHwa7qdjDFW5vmycsgkRb3lU2KSI
	myPWYnxb5XKHg+qLmHCqTYo07EuNgv+IslrcqIJRo6nQLZgYRnPW/g3W+6q9SWoNcKwp7hMHxmenV
	sTILYmcybpZYFit9RQ3fpT5FEBs4drwLbY0PYwyrSuvtmLcH4gPCEGZGdsdtcxFjUWG3sYTvSmPHh
	E7GD33qnMQSYiRYe8p3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvym-00FdmN-5b; Wed, 23 Feb 2022 18:03:08 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvyJ-00FdbP-6w; Wed, 23 Feb 2022 18:02:40 +0000
Received: by mail-ed1-x533.google.com with SMTP id cm8so35908752edb.3;
 Wed, 23 Feb 2022 10:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=6/CbbKb963ZeCrGB3DpHf3S/LmT0OSOkIfiP6ix0yNw=;
 b=ja7eWC8yM81uxKYq1CCj7+E+5nx65m6I8TNqx8d1RSupI8Vu0xgsD4tbMjzlLJwNhq
 vGNC6G8/8yNSBTQ3ffia3tNjLQ6zCcl5cl7vLEcJs7zvEiOsLWMHIX8hcj6fVysJ9YpC
 LjwEe9AbpSRZWE9Z71vkOPl7H/KlZUg7SoF0biFC3edx50WUsiwAj2mDgPQNMHJzyZcx
 da5dUsscp3Twr3zXlsZMp7pFexSsch0gIKY1bubBIdQp/1fyNhQbj0JK3Hz5DuaAtry4
 2G8QoaDP2RvOcxtBor7mFfgycQcWMDYCSljvCaUgsPc7N0MK7c5/er+2Soq+kPplpYSB
 ppmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=6/CbbKb963ZeCrGB3DpHf3S/LmT0OSOkIfiP6ix0yNw=;
 b=VnC5SSo2WyIp4j0LL3rs3aQRmYBAjgxdOH3/+/2W/77b7WyvW06FmtKqiTOEY0lyXv
 UGQ09C6tSxBKsBVtt8f5FNq8InkJds4HHxI+qWUNUz6ugL1MckGkbicEiXSsv5Lr8Iwq
 Mvx5vkLYQDfqXCr6CjzPvuX8bdprrAYJ9zsmf9qLJyA9GPdlLHYLFoSpeR7Z7A2kb9OT
 7fFLVqdRPiGs7mi+FYwon9e6VEvLpXfdFH7v0rSjy+e4U28+HvL0Y3EsJ5iBi8VxjmIx
 RPNtSG3nHPFM7n53pZBf7pS9083Kb3F2GEjvRhVidEMJTynNqQxcQn9CMOXpJAmRU/So
 6gKA==
X-Gm-Message-State: AOAM533lMTqbpj3GetbyzyYlk1hcF47XHGGSDPcSOEW03OnmIOVYzjj1
 xz5uy/VLvC652ftj7/3q7to=
X-Google-Smtp-Source: ABdhPJxIxkN5KO0RrQP8fJuziJbk305Fhl7odZ4cFGCqWDzoQmWYzPbvl+qns8Vw3cc46SN25FRaoA==
X-Received: by 2002:a05:6402:3485:b0:40d:e8eb:1dc1 with SMTP id
 v5-20020a056402348500b0040de8eb1dc1mr602087edc.424.1645639357148; 
 Wed, 23 Feb 2022 10:02:37 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:d12c:c0a:f603:b44d?
 (p200300ea8f4d2b00d12c0c0af603b44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:d12c:c0a:f603:b44d])
 by smtp.googlemail.com with ESMTPSA id n2sm170707ejl.55.2022.02.23.10.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:02:36 -0800 (PST)
Message-ID: <87fc1755-4047-2bcc-56cb-8e1d1cc66f7f@gmail.com>
Date: Wed, 23 Feb 2022 19:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 3/5] docs: ABI: document tm1628 attribute display-text
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
References: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
In-Reply-To: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_100239_276080_A3D52F89 
X-CRM114-Status: GOOD (  10.53  )
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
