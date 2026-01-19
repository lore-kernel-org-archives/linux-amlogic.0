Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB2FD2ECEB
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jan 2026 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvyEpZ/UN+PMKGO7LOTrK6iblm4wLVOwKfxPIRqkHzs=; b=4KOVCbjKZpee7K
	TGmTwt8Oyj9FguMoF4jClpyIMafJYOqn7lNyyQaODDEAI3YMqQxSzLpBwqzCHMY2I530gamDozUPj
	KDILx0ZLz9jB3kNIDo0vPoMxm89kJkq70qLRRp/kf7e7Mt2fNU7XvUYSNZRkVgn9pnRvxFXJUqyWC
	r/A+Q4lqq3wZq9zgEAHVepLG8nbBDhCETdE9AdO4tdSaOziAk9HMIuiZHfljiWuy7RlmWvMr+mO5v
	nciYbiST/dGbU2bNRnVK9vUWQ40txcGPpfUby7bV4mGTbFvEViBlaiHSnT31oouOBT8XZQuFBe4Sr
	WqOLPjT69SdaHY4n4/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwsO-00000002u5M-1ENQ;
	Mon, 19 Jan 2026 21:33:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwsL-00000002u48-3WSV
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jan 2026 21:33:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a0c09bb78cso35938525ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jan 2026 13:33:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768858409; cv=none;
        d=google.com; s=arc-20240605;
        b=ClY31zCKcFTuQn1GWhp6/QK4yTS5weQttCFOUEhZEiEa2/fKruZwRjtCeZpZkOSB4E
         ht29hGWzMyeyJYsm4tm1LVtAEx46iPrXPUSO9K3GOX0HGzmRjFyv9o4lpvb3G80ZjSQU
         Nfx8oIeKvR42043rk3HFCF2U106Y/EIiRDWm03cmi8NvjwFUC/57Th1k5pfuVjFdAZzD
         sNkXqmT3Bj81GpVjfNqKU5plisUOShfoFqRVBoYx4ibrwW9Vm1yYleFYZumvD8wxlDXJ
         wZ75RH2yJZzdXEradIkGdimofSxShuPwiTOGq7BWuYCqd4oCsgoDn5gEAn5mmpgHoBeJ
         HMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WYt6AqzlDCpX/kL4Ld5TnPmJOih6jU/LzjugOjIWs5w=;
        fh=dCcMnC7K/H48NZBWExUhEMXyvjLeZZjmdRebNrT4Ybw=;
        b=IJSc+PEp7zUuqV34DIREmt2m1Y988DDCSbn/URcwT9jhZrqAdukO6zcmznluDknmbN
         5vtTjO8oAq/CTsUZ/pq/q3NlOVlP0E000VSe8zGNUsiBKKffEFyzq+yYQly8xBRjUrGZ
         /WUf21YnWbL88FxLl/sGRinAJQRQHhcFE3/NwUzMNZ2feaLqjGWpILP3rOvhKIWLbm8s
         Y9JXFP79KBUYMj5wE2O377jvPwXSORvs3d/oPFAX74ZgzXbe9CjC9UiucBeg5tz3Fm7/
         nQAZHG7i8Ku3zQKdEfxKT++J7UUbrBeW7rRJx5wuPR9V7Oy1ikmHjwYlXU1tqtnbAKVe
         FJeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768858409; x=1769463209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYt6AqzlDCpX/kL4Ld5TnPmJOih6jU/LzjugOjIWs5w=;
        b=BNVIAX8gnjjFdsKu6le6zv+wtZSLrlEXxVMeHbNyWXTAuVcEG4IOQEGaXntyjWbcoI
         BJFfmMtwXoHnyOx48+xjYQ/inWQoIo+9jWmAsyXJEvUQICPZ74kZGRHHvLHTejxmUrqa
         v9qsSGEIwHvZC76jpwhB7iqQ72rNoDPboBDHjSZPTCUp94MTRov6rz3bwYfdVG+4rz5H
         OiC+1AEVD2cAJ2WxbILzQiklme4glxzTfAZY7fS/mhpmwXDMgCJLyAvsV/MuZQPDQZmA
         HC/76kjCh0XfvbeBn+Avm1IKxpE7hk9yn1S8v1Qi8/VWX1n8DUx++yS7DdPS9ZT5mo01
         FFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768858409; x=1769463209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYt6AqzlDCpX/kL4Ld5TnPmJOih6jU/LzjugOjIWs5w=;
        b=cafNsNjQ9Gzdr+Xf655UZWb8a2ZeV+8R0/2mBba+h37fMyStvhPuu/Vw1ODetY2ymT
         cxhlALQ+RexXyAhRr/3s9ldtldO9fBUR+YVE176687vofldb27nWqwfG1wiMeUB2HTW2
         hIt7B04x8xd5XbrCVSoadASgL4D2KBban2jfrBCEMDfzP4JaR1qardkOHjhDoHWAVy/z
         Mi/O1I7OVtfKXh1SsYpUW2PFqTwUgxe8YRKcaEa0jO4dkWPXyf2lFSz4938kVKdtFB7J
         N41KQHSOUKxggDuoHcjzdXYd3FNs6L9Us89aUdUr1bq3fe5ZacVSvJqCsYf0+RT+zsi2
         M18Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3BnNAD1oo6NK1TNzfglD+z+0LurhY2xFbOzEaDhX5CkCTe4wxYxiMPOAJLmNp74aJSbOYJwKdCP/cRvbf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw44usBzEJ8aI73grNLKCKl7PFreUnNm0KgRPuvNVGQb9PuPjkw
	6Hc3ChOewlNzYJba680dyI2utCKo/ZOcqDgqkVYyp3jwdCz2+Mho+ujcpJFSHxsnGpy9QeKwPLH
	c2dyeYUk9zSKAnDZM9gq4X8U7GADjF4o=
X-Gm-Gg: AZuq6aKox15Z4vnL9RhbKjThZ7KfJB2OPnr645gqe+YsbinNOlKCG8/bruXEGsYniFB
	nIf0niRsN5XHCrSuYEGpQHDi3X9AduYfYUiQ1LPs/BVDtdUDv3t1ibE9FhE/pP1ORKqX8DA2wh6
	6vne1KXwZ0erRCXU8oebMeRuN5FF1yhvaLH3QWgMYjDVE4sHJ7Ay4DeP9rEh6KLey0TdC2s83QA
	hSm5Zo6vKZuAwRMeuplN50Pebof5oeNyWsd5UkK7+/mxyJBAMlaxAGH+6RAEFJRdwZTTXK1d2LI
	A7NTDH5uwuGRyA4cr5aQo8dq46nS
X-Received: by 2002:a17:903:2341:b0:2a1:3ad6:fab3 with SMTP id
 d9443c01a7336-2a700978ecbmr132238185ad.1.1768858408931; Mon, 19 Jan 2026
 13:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20260116023611.2033078-1-nick@khadas.com>
In-Reply-To: <20260116023611.2033078-1-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:33:17 +0100
X-Gm-Features: AZwV_QhxR4hX4a4tHQP2LMf0jRGW7iOKBC1pnItltQ9JPA2FUwNRfeUXWKlm2I8
Message-ID: <CAFBinCDcyH3bFbqy4WspipzBbf-ym_1vJrTA_ecB1rP1WABG2g@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable eMMC storage
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_133329_882644_DDDF85D1 
X-CRM114-Status: UNSURE (   8.38  )
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

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMzozNuKAr0FNIE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+IHdyb3RlOgo+Cj4gRW5hYmxlIHRoZSBvbi1ib2FyZCBlTU1DIHN0b3JhZ2UgZm9yIEtoYWRh
cyBWSU0xUy4KPgo+IFRoZSBWSU0xUyBmZWF0dXJlcyBhIDE2R0IgZU1NQyA1LjEgbW9kdWxlLiBU
aGlzIHBhdGNoIGFkZHMgdGhlCj4gbmVjZXNzYXJ5IHJlZ3VsYXRvcnMgYW5kIHRoZSBlTU1DIGNv
bnRyb2xsZXIgbm9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3Rpbmds
QGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
