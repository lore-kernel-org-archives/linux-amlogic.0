Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19055EB7EB7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeoMtQpFiW8/AGPnosnwoQNiBHmJkbRtgagcVYxFJ60=; b=M4GHyPir9VWpS2
	8jgM2gQQ5ULoMqpjXxNP9+ypPMzG3vEbPLpDL3L88cGVTBBM2wUuru3Es4Eumsx/3ndl7NxVTcivR
	gHqah8T9gDpaCsajb7YeRmq7z6bqSQuo5um3F9QxxFkb4GVoRC+3r0/9UksqaV+3FyhApRq9vkKLQ
	CArLytKAajqgkzSy97/Zgr16PZOh+r2iY5UP0GxUqiX2x4RWm8anHTtU1w/yhb0y65ssnwtXlhE06
	/diWqYk24qc9P7xkYP9rAkofF+mWTH/sBbkZfWGDwEnBJ3ZSanRlFc+USooIrjXnoTlgAFwFHk1TC
	AhXgJp73TO5Z9xU+F+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiNC-0000000GrCZ-0W28;
	Wed, 04 Mar 2026 09:18:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiNA-0000000GrCM-3SSx;
	Wed, 04 Mar 2026 09:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8BDA60097;
	Wed,  4 Mar 2026 09:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D60C19425;
	Wed,  4 Mar 2026 09:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772615907;
	bh=DqQFigDJ368Z5nPS5m9Q7Nq+wqG5hNprsu/1QDUlhA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BnWrIXroRr6DGO6COgDOsecmpa7x+fF4yHx2u2k5WsZ+BLWzvzUUV7uMfNIoE+iQs
	 mdoGPSlZc5kn466gYE/XfSeyng33oXkMDsg0aemnWoU6RYpNSCTaHml0kjxL8q74MP
	 SGXt4SuWVja8WXGIX2YM+yHvI/BtWxlwFxtniqrT2FTrVITiI0mSIOQzGxB40qTb4t
	 01cuZXikRWIUb+pX7EDFNBbWVCDy1Hz6X++yupk9wfbTs0+Fa6FiLXxi0KaGhO19NR
	 DHp8BPZqYYB7ADvmkyvU/D4747R18C1Chuzd92zyNH3hQnNTSLQ8HWJskm8ahAhvXP
	 ElVD3LF0lvU+w==
Message-ID: <d9e9703f-8166-41a9-a927-5bcd7ad4a8db@kernel.org>
Date: Wed, 4 Mar 2026 10:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] powerpc: drop unneeded dependency on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>,
 Scott Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-pm@vger.kernel.org
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-3-d597916e79e7@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260304-gpio-of-kconfig-v1-3-d597916e79e7@oss.qualcomm.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAwNC8wMy8yMDI2IMOgIDEwOjAyLCBCYXJ0b3N6IEdvbGFzemV3c2tpIGEgw6ljcml0wqA6
Cj4gT0ZfR1BJTyBpcyBhdXRvbWF0aWNhbGx5IGVuYWJsZWQgb24gYWxsIE9GIHN5c3RlbXMuIFRo
ZXJlJ3Mgbm8gbmVlZCB0bwo+IHNlbGVjdCBpdCBleHBsaWNpdGx5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21t
LmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IChDUyBHUk9VUCkgPGNobGVyb3lA
a2VybmVsLm9yZz4KCj4gLS0tCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvS2NvbmZp
ZyB8IDEgLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L0tjb25maWcgYi9hcmNoL3Bvd2VycGMvcGxh
dGZvcm1zLzg1eHgvS2NvbmZpZwo+IGluZGV4IDYwNGMxYjRiNmQ0NWMxMWRjMzE0OWVlOGI5YWRh
YmU1OTM4ODJjOGUuLjY4MDVjMTlhYzhhOTE1ZGFlMWJkMjRiMTMwMTBhNTZjZjE5NDhhZDQgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L0tjb25maWcKPiArKysgYi9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvS2NvbmZpZwo+IEBAIC0yMTcsNyArMjE3LDYgQEAg
Y29uZmlnIEdFX0lNUDNBCj4gICBjb25maWcgU0dZX0NUUzEwMDAKPiAgIAl0cmlzdGF0ZSAiU2Vy
dmVyZ3kgQ1RTLTEwMDAgc3VwcG9ydCIKPiAgIAlzZWxlY3QgR1BJT0xJQgo+IC0Jc2VsZWN0IE9G
X0dQSU8KPiAgIAlkZXBlbmRzIG9uIENPUkVORVRfR0VORVJJQwo+ICAgCWhlbHAKPiAgIAkgIEVu
YWJsZSB0aGlzIHRvIHN1cHBvcnQgZnVuY3Rpb25hbGl0eSBpbiBTZXJ2ZXJneSdzIENUUy0xMDAw
IHN5c3RlbXMuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
