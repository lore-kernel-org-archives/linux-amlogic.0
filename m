Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A918C2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ID7lqCr6HMjUveK7JkiVHiguWfAbvUdYrc38noOn5FU=; b=a8l845wwKTTiWW
	5SGIOcBKhUuvLHHn3+c1n64jSEryyxw0CD7QYdcV3g3FS7d6xtf9AAwlHhtwse/YuBbpuiig/1OvU
	y8PNIQXAjY+B9Xxgv497gAGAfdHvoGc3b5DDIvzqUf0ny7T+CSsbhndJK8sR1tbTJuxkI2UEAn7uU
	1wYbvyEekVmQLMaPpv+BrUsh5KSvR1qs30OoHO0bgO/bprE0xrlTnsSsM3AggQUH81y7htw8AeBS1
	dQRWI6k8fdvFv4Y3WPrydZf5S8K0lUqXPQk1L4DRf+KTJi5IsNGynym03CxBz0Bzlg2C0e1NUfK/v
	xOn7GJBxydhfeFViQihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDZ4-0000000BEpO-3UaY;
	Mon, 17 Jun 2024 14:42:34 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDYz-0000000BEmA-3g5O;
	Mon, 17 Jun 2024 14:42:31 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-57a1fe6392eso5994706a12.0;
        Mon, 17 Jun 2024 07:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718635346; x=1719240146; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E2YQNX6Tuz8HfUHpOihGxh9fyCb+mnp+I4qgACuBpKE=;
        b=KVQORxOMHgX+G1W+pPWYoOFVmDQoaynh8iOSHegu1JxJGsaTrAUaezDpr3jhRZtQ6z
         qMKVtJT3hSIvmXYqcCkHlKqvrTZteOtn7452d8d9uEormzCMZXj9WeQUGUl5OPqwKMm3
         8l2Cv6OpPxJjsTq0iwAcHHxp4i9y5y7nJqgGaWm3f0uxjA8WNjRzigHUEefmOxWUW+5H
         /WJsHHd451Jp8ImOGLSri9bEIXQbjtmmjMAgyLN8qsh8NW19osdekF5+nRpOMZ6K7MtK
         aRDJv7MkQCMhP8LEinrvtZUq6+mW1KPZsbqsZaNHra0WfZbU67mkT5govpLdymoTOmEC
         h1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718635346; x=1719240146;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E2YQNX6Tuz8HfUHpOihGxh9fyCb+mnp+I4qgACuBpKE=;
        b=mGwdSB7I1oEaTztzrlpsyyFPJBr2VQBw1qlk2uPUX3xe4EeA4KidxfWX3finiIsl2J
         HiCxdmxYFzkZ1d7OeqjUQKsTVKG7mgoEY4n2IjZIR0SIyx8E1R+vIbsuPgfHQC+aYtyp
         PKHLL99K2miBS6qJEcD/+t5IYZidwwTYiIWW/Fhf59LPGwTHgz7jAs9TLvuTg4beC8yA
         YOc9DZILHes/RZgWwWF9hyScwYWXBRAIBxeP3wMgndVDQeB4i2hfcDxEJLW+i8ssrsfF
         tSlaNK+LTbscKHXGFy0FISdCTAyZuEiW6fPXICe8iid3gSWACbQ+LTHwDK67xjrSZzx0
         YPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV+gbqmvsNmj5SccOddVM6dXfcMCByEnnhpvc0LClvcJ0A0P1xA0U74hTOPpaJfjj+QdlnVnGtys90XO3BumEJP4PBtPKHD1DrkcgD7jk2L0fU1ULaIpcJ8tnu1Dsivgqz0SFjXneD2A2xU17M05n0G4w1hd4vhQ==
X-Gm-Message-State: AOJu0YzsqD/pNRcMfZY1kfpB+usSE6nnNs8B4W8Whugu9vrsQ3N+jnS2
	D+vo/HRQ5CtSbwFUNBeD9ugKSSCsPPTUCc5bU1hP0Ix74mRoWnlN
X-Google-Smtp-Source: AGHT+IGkzpQ7qdmk73JHhNvar3yzbeO/0JuLTETghlv9ovmWg6RAvgWc3MKokHO04h0aGO4cAJzoZA==
X-Received: by 2002:a50:8753:0:b0:578:6378:bc4 with SMTP id 4fb4d7f45d1cf-57cbd69d997mr5941494a12.10.1718635346075;
        Mon, 17 Jun 2024 07:42:26 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb743890dsm6514525a12.83.2024.06.17.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:42:25 -0700 (PDT)
Message-ID: <a818344871a1dd2bf139732a7de9016ece456288.camel@gmail.com>
Subject: Re: [PATCH v3 04/41] iio: adc: ad4130: make use of
 regmap_clear_bits()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Trevor Gamblin <tgamblin@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>,  Lars-Peter Clausen <lars@metafoo.de>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Cosmin Tanislav
 <cosmin.tanislav@analog.com>,  Chen-Yu Tsai <wens@csie.org>, Hans de Goede
 <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>,  Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Saravanan Sekar
 <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori
 <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Date: Mon, 17 Jun 2024 16:42:24 +0200
In-Reply-To: <20240617-review-v3-4-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
	 <20240617-review-v3-4-88d1338c4cca@baylibre.com>
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_074229_949666_74CA2808 
X-CRM114-Status: UNSURE (   6.33  )
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

T24gTW9uLCAyMDI0LTA2LTE3IGF0IDA5OjQ5IC0wNDAwLCBUcmV2b3IgR2FtYmxpbiB3cm90ZToK
PiBJbnN0ZWFkIG9mIHVzaW5nIHJlZ21hcF91cGRhdGVfYml0cygpIGFuZCBwYXNzaW5nIHZhbCA9
IDAsIHVzZQo+IHJlZ21hcF9jbGVhcl9iaXRzKCkuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBUcmV2b3IgR2FtYmxpbiA8dGdhbWJsaW5AYmF5bGlicmUuY29tPgo+IC0tLQoKUmV2aWV3ZWQt
Ynk6IE51bm8gU2EgPG51bm8uc2FAYW5hbG9nLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
