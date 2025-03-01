Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50066C021B8
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Mar 2025 18:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqunjXAHxVVaariNkMOYRegv+3u41gkv0JiJUCmnLZE=; b=aWRMRZTaQ3XIMP
	jMJcyAbl7Aws+zIqXU0/K7EFCy4VvSmLlts1aJ0ZWLUjWYyKP1DBVSTx9QgvM4aQ0MN4O7uB8GfBy
	EZlUDWNB+o7JZrFz91nmIMHbMls4/GcSOsM9XfC3nAuU41F/tRLgk7mTygEE4PApwxBaTJS8K762I
	OEZ4RkihVxiQaeVVx2xymYUf8VI0WRdr7AhzAvQxBsvaZRxnJLh1PNKG3tfAvefyqUHKxUFKNR6k4
	CGA7ogDJmTqm5iisT86justxiT/rbgCz4dPwWHdKhCT2LWehiDBis/lFSKeA5EewqfDtTa3xkC/Hx
	vx7J+n8ZVUKpQ+vAIacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toRMw-0000000Ekgm-3n0w;
	Sat, 01 Mar 2025 18:15:22 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toRKH-0000000EkPj-2kPq
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Mar 2025 18:12:39 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5452c29bacfso3285005e87.3
        for <linux-amlogic@lists.infradead.org>; Sat, 01 Mar 2025 10:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740852756; x=1741457556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
        b=BwJaihZkH530zVvmfCBpMS2GTE1ybPQWN45r4Kxib3bBE+/UZzfL3R2uWto/yP5TlO
         PI/9sU6RhY8lub50ig2t6749VK2IVeQh+rTq/g1fri781qyaSYkFYmdMhPFtXQ5oubnT
         LZWcbzTIqGCI+Iwr0/qFqSidUpS1VaLvLsT4RgUt4Lbaeo2HeCTlxlu5c8+TfF6zK0Gw
         JEdNFDs4+r1bcZ10b6JmKIziEjpn3tBDvEMkdIGw6X/tz7AvRHgco2ezZezNatSMicqR
         6XS1BgpsjuZ8RuWG1+ADC1/b3N9J2hqp7WglAVC+uhvK/9WBvEeTewjAlVaNfz0ST3MZ
         tmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740852756; x=1741457556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO09TeiGW32giSrF/zFbXkUU8toE5ieO9mC6ZpO9u5A=;
        b=qtaFBQXWFPa7KseeQwGPhAWC+bF9Bf7a9Ku8bQGicSav6ItkQ3x7kFSJLagJsXA7Sc
         c61ECFYtgRv6u82Q4xHaITr6pHkXaZzhM3BjAfI663ufdo89yk/CYIW0WBJtOsCH86yE
         ua7h6woLGZCI6gfkAIaeP3jIWpPQLgmHo5z9Ge4JbuSBFMK8DZv5TWT90laeosB9OrRc
         z1zBiQTYdEDV2surxAewPOsmsFKRtwxTQEeXvr6VU+xgNVcXj4ktdNvvPEBGO/xaCHuy
         HwdnkqHVtgErDW63sKzsUNfXN0zlntSYsL+7XO0rqqYytgN6ts3XJ6rqDrwagUzA/0Hg
         Xtgw==
X-Forwarded-Encrypted: i=1; AJvYcCXE9h9pQQAMJhE1pqVVxjtj7w9IPRj8SiFoEGPCwT9Cn9QzQxYpVBrRS1771yER74RZg96pmEAcy/TNUqH5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwk5DrfRIwF8hFj+AX5FJnIGvbaM9F56ICI7p+B5AI7PPuG1fR
	m9lol9vFKFRvJVZ3X7mibM73LVz0hIEJ0IZX31aMJhJb1/J1htkSPFoptvgDY0lHS84h35/fyNw
	g6HdIDmFQEX8EBaPhIjL4dk9nelqrq0LFeVz9Kw==
X-Gm-Gg: ASbGncveIi9ePR8qfNSSR7NWmCYCb7BYnfUJMYsoqr6+TBHCtSE9IX/MIBHDvIn0W/k
	YkEQz6ZsJ3GO9XNI1j2YR6/Yc3BpDA34T01Z/W4TFp/UPTXpBPwp9zDax4VK/ysP12A4IXsQDNw
	emJ75Ej4bmTkYWpJ5sXxcQ8V6JhQ==
X-Google-Smtp-Source: AGHT+IEwNP6JAG/ImVlBbFKSPeJyF+kN1wgYSyFdUn518Azn4ly4yqI8vygkNmnNaNRO/2W3XMFUQZ4MRvI6PuiQBfo=
X-Received: by 2002:a05:6512:2391:b0:548:f3f5:b26a with SMTP id
 2adb3069b0e04-5494c38bc42mr3507636e87.50.1740852755828; Sat, 01 Mar 2025
 10:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org> <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 1 Mar 2025 19:12:25 +0100
X-Gm-Features: AQ5f1JrMxHjOeiAFu01e9_js8hUt6QETaY6N275XhvcjrnB0bEBgE0astCzSAEQ
Message-ID: <CACRpkdaWjTiqSUj59YiQZ1jsJWzHZPMo3xS6n4_JwdAW6B_Kfg@mail.gmail.com>
Subject: Re: [PATCH 06/18] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>, 
	Dianlong Li <long17.cool@163.com>, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_101237_697294_65116F33 
X-CRM114-Status: UNSURE (   9.30  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMjgsIDIwMjUgYXQgMzowN+KAr1BNIEFuZHLDqSBEcmFzemlrIDxhbmRyZS5k
cmFzemlrQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgbWVtb3J5IHBvaW50ZWQgdG8gYnkgdGhl
IDo6cnRjX2RldiBtZW1iZXIgaXMgbWFuYWdlZCB2aWEgZGV2cmVzLAo+IGFuZCBubyBjb2RlIGlu
IHRoaXMgZHJpdmVyIHVzZXMgaXQgcGFzdCBfcHJvYmUoKS4KPgo+IFdlIGNhbiBkcm9wIGl0IGZy
b20gdGhlIHN0cnVjdHVyZSBhbmQganVzdCB1c2UgYSBsb2NhbCB0ZW1wb3JhcnkKPiB2YXJpYWJs
ZSwgcmVkdWNpbmcgcnVudGltZSBtZW1vcnkgY29uc3VtcHRpb24gYnkgYSBmZXcgYnl0ZXMuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BsaW5hcm8ub3Jn
PgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4K
CllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
