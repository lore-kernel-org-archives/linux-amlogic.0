Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1368CC43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5BAE218FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 14:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uY0MS6Kw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VbT/KzUg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5BAE218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmxBFMgdP+F7JVmQmAZdC/aipU9BQbg3bMsG2OpMmUM=; b=uY0MS6Kwhux1yK
	e2GiHx1Sg03+QvJBtPGQxuAcMlFKKYxSqvuiQYlgsVIk633/EC24UoVyKtXftVxPJr4CwHz1+pZWS
	MM2xo4CzYMdwdD32cGumJIuMY+YGLLVVcN6SI4H0Zyf8LctOFNV800BtsXSPN+McA0PH3tO6gnGlh
	nppDZOTnmzaWToaX6F+AkKzlJcRdNQzSDos0eVq1L2dieUHQJZJbOfOeHEZPJTYGIbkl5avb8MJ7q
	dusp7G95LsLXCD+CQGOS7pedE6mcYAMZzhJTJmKkIMME7KggEzSzqRvBLc9DaBuGmDz3fOHgxpI+m
	CF1/o2KHaKSTsc0hxGmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5AWB-0002qc-BP; Sat, 16 Mar 2019 14:42:35 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5AW9-0002q0-0O
 for linux-amlogic@lists.infradead.org; Sat, 16 Mar 2019 14:42:33 +0000
Received: by mail-wr1-x444.google.com with SMTP id h99so12427994wrh.12
 for <linux-amlogic@lists.infradead.org>; Sat, 16 Mar 2019 07:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=CJUlkJDOJ1hL7l6oYVtamwToI2/atdgivGlg/bzyu8A=;
 b=VbT/KzUgYUsL4L9VJisEp2Q4k5zipxHYCTlfN0lSckJDemm2F5n5TRIxk6SP7dblHR
 dEY4GtqoYnosze/Y55WHm17gkeX70ti3oeLmpCg6U/H/dJAOsDjCfj7JbMlMMZyGkPFF
 i7SMD+SUaCVsZVSO/PLeflll6U347Id89hCdmKp/ApunkhV0YHcjzz7dcDkXKoThsIHb
 ohcbFHAGTkuHvupM1dnao7xyCzp2DaUDtd6JIQq2jQ97/zRCj76ZuoNYPaOlBVWwqlU4
 bWVdb5dqPr4p7oFGbuXyhQZHDJl+lZ6qxFmHLISYa16amQ8a9MtFDBQ9cQIgKfVqFlJt
 5+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=CJUlkJDOJ1hL7l6oYVtamwToI2/atdgivGlg/bzyu8A=;
 b=EFejC/qjUc0DOK1kceizZMfPXNyAiRzxPW4qyeV5JqPPRP8ri+J0OXGEy9bz2L/J4L
 H6xh4yj1meoSz5/4K/Uus8yh/GTxKzCbxurrl77i7kbqrTsZwvW7JGz2ExBIx/fK4JEd
 1eppyu4tzyEhKA2aOH2zxs6+CqryYOObMh91hcogSvbwssMDdj/VZaT9/DBeG08jtwyd
 HFmVAlgHCPNQSlizAvBsbKw/A3l5njpAhtG1pdQPy4THaG2GEmV+MUqAe3CsFBmXQU0T
 eya+rGpbQVHaa1NtXOJLp272noJJORKuhbmLqFcN2Cis0VMT5forWk8jgTJR9fy+g6+m
 v2Tg==
X-Gm-Message-State: APjAAAW/AZT103KWnwOk/9EgGmzxPNqdwtP99Ybcqp6JzMg2yRrbwJWI
 syPAQSLXiaPamJHCO36R1vEl8g==
X-Google-Smtp-Source: APXvYqzuseoDAzIcxVKjEJJUkJAuA43Wpyy7J27ZIt7Tek3l7Lo5AwUT7+G5JFN21JOVC9kpf/UtdQ==
X-Received: by 2002:adf:dc4d:: with SMTP id m13mr6353436wrj.330.1552747351291; 
 Sat, 16 Mar 2019 07:42:31 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 f7sm3841701wru.3.2019.03.16.07.42.30
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 16 Mar 2019 07:42:30 -0700 (PDT)
Message-ID: <5C8D0B55.90200@baylibre.com>
Date: Sat, 16 Mar 2019 15:42:29 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 07/11] arm64: dts: meson-g12a-x96-max: Enable BT Module
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-8-narmstrong@baylibre.com>
 <CAFBinCCbu54hvATKpQ+DxZ6g-FCJ_7Gty2v3HMWJWNFDbwwKwQ@mail.gmail.com>
In-Reply-To: <CAFBinCCbu54hvATKpQ+DxZ6g-FCJ_7Gty2v3HMWJWNFDbwwKwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_074233_050035_A0898FCE 
X-CRM114-Status: GOOD (  13.89  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAxNS8wMy8yMDE5IDIyOjQ4LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoKPiBI
aSBOZWlsLAo+IAo+IE9uIE1vbiwgTWFyIDExLCAyMDE5IGF0IDEwOjU3IEFNIE5laWwgQXJtc3Ry
b25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4+Cj4+IEVuYWJsZSB0aGUgQmx1
ZXRvb3RoIE1vZHVsZSBvbiB0aGUgWDk2IE1heCBTZXQtVG9wLUJveC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+IEkgZGlkbid0
IGhhdmUgdGltZSB0byB0ZXN0IHRoaXMgeWV0IGJ1dCBpdCBsb29rcyBzYW5lIHRvIG1lLCBzbzoK
PiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBn
b29nbGVtYWlsLmNvbT4KPiAKPj4gLS0tCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZzEyYS14OTYtbWF4LmR0cyB8IDEyICsrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1nMTJhLXg5Ni1tYXguZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWcxMmEteDk2LW1heC5kdHMKPj4gaW5kZXggMjFlNWRlNDg2MTNlLi42MTYw
NjYwMWZiNGYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1nMTJhLXg5Ni1tYXguZHRzCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1nMTJhLXg5Ni1tYXguZHRzCj4+IEBAIC04OCw2ICs4OCwxOCBAQAo+PiAgICAgICAgIH07
Cj4+ICB9Owo+Pgo+PiArJnVhcnRfQSB7Cj4+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+PiAr
ICAgICAgIHBpbmN0cmwtMCA9IDwmdWFydF9hX3BpbnM+LCA8JnVhcnRfYV9jdHNfcnRzX3BpbnM+
Owo+PiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICsgICAgICAgdWFydC1o
YXMtcnRzY3RzOwo+PiArCj4+ICsgICAgICAgYmx1ZXRvb3RoIHsKPj4gKyAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiYnJjbSxiY200MzQzOC1idCI7Cj4+ICsgICAgICAgICAgICAgICBzaHV0
ZG93bi1ncGlvcyA9IDwmZ3BpbyBHUElPWF8xNyBHUElPX0FDVElWRV9ISUdIPjsKPiB5b3UgY291
bGQgYWRkOgo+ICAgaG9zdC13YWtldXAtZ3Bpb3MgPSA8JmdwaW8gR1BJT1hfMTkgR1BJT19BQ1RJ
VkVfSElHSD47Cj4gKGF0IGxlYXN0IGFjY29yZGluZyB0byB0aGUgb3V0cHV0IG9mIC9zeXMva2Vy
bmVsL2RlYnVnL2dwaW8gYW5kIHRoZQo+IC5kdGIgb24gbXkgWDk2IE1heCkKCldpbGwgYWRkICEK
Cj4gCj4gCj4gUmVnYXJkcwo+IE1hcnRpbgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
