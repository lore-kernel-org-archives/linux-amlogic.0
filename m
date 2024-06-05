Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF10C25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlxwQXygTsgLO8LyEcMbSfDREr7g+DhU9tpvoHq+S4g=; b=PHmG75GBf6dIDY
	feVpBezuqvz5j0SijVbKokjkWHaE3/rkcj5CAQXTs3EfuNOkSl/uh4FhnSSzQTjZF8jnj1T2yj//4
	vta3QDNT9dKhQyRAj0Qb+JZ4/weeMo6P6E6UuGBz3hs6GTUT2o28URdIGQB2rXDFy69mznU10/w64
	yzHP0xcqktPDmSA74jYx0w6eswKBKP24BKatNRZZr9b33SLAUpF6bKdsmmuru/QUjKhHMaeoCBmBS
	dHaexdbQCI/l08ezhTt7yC3ATGbqkNd0B2VhwylGd1HGMt8Y9Sqyji56+VtDXpJLFaBy3kSXNueUs
	ZfpS8LVTnEZtIWuliXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv7R-000000077Z5-3YVH;
	Wed, 05 Jun 2024 18:12:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv7N-000000077VJ-49n2
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 18:12:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4214f52b810so1883025e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717611128; x=1718215928; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
        b=VgM3J3q2yThUY27nsWhcY5Ya6Lenmu20kJ+hUIFdFC+7cLAKZhNHspnbbS8/JEhT9k
         ieMGOXhsZfmoRyLaKbG0E2dqtzQBxxwx04dMok4ca4SNgtGJ5u1iuIcnAvplDSAF5EVS
         yrj7j6sXGLHaAjWVKtm1u24bly60NCrLhsFrablzaWR2YuchX8YmBbZEPBqFEm4TpfK7
         9Guj9T+CX7dozhFU6qiZZPMdzD54QLjtZ4ils3ABfQEqNGwMe6M0w0E3RpyRQrKlcZ5Z
         7aTqdfO8urgcGRAVIZitmuDMX/qNqD6NPOA5cmAPd6rijD1ksf/+aGIkd1o3D/DQUy8e
         HzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717611128; x=1718215928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9OkqguqeJwlzfT4o/NLntU6DYYfOLDylgpwXRTP5l0=;
        b=SsRCV4UX5gQ3cjlUrcNvT5jb2GEedVg3PEBiJVPcBcevSgoC6FmpFrJahP4InePaow
         JtHLOCIMNsL+41mFoE1X7XwGq5pFqZbCSLFhQ7oafHauQT1jXWxOBFs30b0QGxqnT/Oh
         3oWvjirMqh9EmK/Ir2r2nQZa6WbI8hDaVhH8LY+LQZac6TCGl/fSTSh6eNGzWWtcx2dR
         +bIa0Htyrmp1z/ngB5m4LAYVjGi/SYyD81P0SbLeEo/DMosfsyIOCoY+O+ohpL4IS6Kk
         EFZ5W3nco4cnxF9hJfVUSx/XAm148jfSkcJBaf1YwmPXVHzccgMKV1h94eQoy7L80QnQ
         AchQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOGtA8bW3eKOtUy7RE4N/7SGUtJL1P9evvmT0hWJ7opyFwe0KYS7H+egKvQx0EjmnDzDnhOgiAZ7/0q3LUVzAVOpyxrowkfUGH5eduaAY2nhY=
X-Gm-Message-State: AOJu0YzFXVJBTznd3XK4TyUwq19ommkQhL5lpAhps5w13NegiROrhR+N
	PtRIM1+4lZ1OBtvxHK3JlRINIkLIXnr3ILxQ+pAChMWAS8mEAVVMKeEqB/hPK4s=
X-Google-Smtp-Source: AGHT+IEvaA8Q5QYjqCVUDlFHwF6aq9tSqiBZFVHoOS8pIX0aZ0OJo7FFt2ruymdqoNfkRUE1c/CDUw==
X-Received: by 2002:a05:600c:4e92:b0:421:29cd:5c95 with SMTP id 5b1f17b1804b1-421562ccd31mr34249765e9.10.1717611128459;
        Wed, 05 Jun 2024 11:12:08 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-35dd04d9c68sm15224191f8f.56.2024.06.05.11.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 11:12:07 -0700 (PDT)
Message-ID: <d7cfe53e-533a-4c39-b4d8-cdbee3617294@linaro.org>
Date: Wed, 5 Jun 2024 19:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/17] nvmem: Handle change of return type in
 reg_read/write() definition
To: Joy Chakraborty <joychakr@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, manugautam@google.com
References: <20240605175953.2613260-1-joychakr@google.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_111214_066563_F4E6418B 
X-CRM114-Status: UNSURE (   6.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 05/06/2024 18:59, Joy Chakraborty wrote:
> Currently the nvmem core change is picked on
> https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/log/?h=for-next
This patch is reverted due to next build failures.

Please resend the series with this included.


--srini

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
