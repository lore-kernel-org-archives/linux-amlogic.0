Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C0CC25B10
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3tdM9SjVyWry6HFUXSeRFSYXShc56UQy2OcI5DJK8Y=; b=nEe7lm+VrXXMHl
	Nbu+CgLAOLXnMf9O+wt5+RReaUJM6BE99I3+uU1C7qYweEln5NI4QOWywfU9OnbU80uFsgnlZOytx
	hAhKqUztuQcqYxC3Z8An/zBDK4RC6e22ozBd23Zxbllj4C44CYhFhdg2FkBNbUZ3gqE9bgXTmiEAo
	Z8HUjkd9vfdv1Z/zGLPl5b2jvwGzjcuTJRUWfpOJ3m7HDpVtg4PfOddbJg6WNhvbfrkQNr3z1p8EC
	0sukJtaSZR2Uz1Jq+BuPxHvKUEvCPq9VZ9lKAtqH5QH+pgmktw4rCKUgR6ObgfRQVWYyDRCiZlntv
	muGWLsY0jE1pZJZCRu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6RdH-0000000CK3a-2y7R;
	Mon, 13 May 2024 09:06:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6RdB-0000000CK21-2myV
	for linux-amlogic@lists.infradead.org;
	Mon, 13 May 2024 09:06:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-34dc129accaso3091738f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2024 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715591158; x=1716195958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YBzaaIEgHGuGeJGPiYUXItWhfV56AKE1pxOKn1aV1Sc=;
        b=dHREbNl3hyVsN1AZlRpraAg0MZxfEDmnSwUwfhMYqz8U2gn5m8e5rfr2oJaycIeG3f
         +0hWPQLvvoXLwfnf9e1Dmuxc9+zj2t3OGO2UmnKoqmgQDN+Fnvcg2wulo18oMShYGkWW
         La5j+KCDneItc0wBzgowvkvLCWBfa54EvYM6NalZxQIp8HFR8QiyzyInOL+sR/yKz20c
         nHG5iJp7NMTAgTgN3PHvQQYkVZZCI+TfrOQeK9xWBbuZkjl+owzNl4He2txlimAB03ju
         btAXi0fP1tpD+siFABAZuETKPKGtG4ZrBaAW8wHgVNWO6xOamCvzuEPvwjh+NIBdgt5s
         QNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715591158; x=1716195958;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBzaaIEgHGuGeJGPiYUXItWhfV56AKE1pxOKn1aV1Sc=;
        b=RSASCEk9jGhkx3qT18y70zgau7AG0fHk/1SaBGSAPI2BQSkK4nn0grEhxWdQelNlS0
         I1kWr+iQH+EVVEPfFsnJ8ZOTNZSODqFoonqJpxpQyWAGC47yfERNdkWk0/wGY0HLKeVn
         qKIggehZIbzxbBTDCjviUPrcTw/E8HQVkDpJ3UwtesVPvvmmWTtaD1Ei3MXpZ2DEr3Ta
         E3++o4WiIwjI2FVjUwvnGn8GNKhCLjgNviWyF+4JwqdDrSFmvwwq9vK0UX7h+BddUWAN
         yd8eDVlVBB9W3Syj0wjiYjMqtIriC5C8icpGt2D6F+TROtyVv+WLGhZ7QckH21/GKsYy
         lMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyILUNZExMSqGu4245FE+Ca9PqDrlIlyhUrdv3HA5N08X9FD8qN5FtSYLFLzhKGyMVGIcz2R5yRHm/5CBCmA1yz7xxS4kvfrZE2SGLzyOYukw=
X-Gm-Message-State: AOJu0YzMp92W7RgUAQkbCeJY5QF/DiwMJA0RRgBYp80pB0Yw3qtjoZaR
	GDVe3nthoeYrcm6ye5ddegAj+E7h5J2HarJDtxY3G/Set8w+wA1uQOj6Zg+L9KM=
X-Google-Smtp-Source: AGHT+IFWiNTtriwb0hOXOiFQhJA1JdMGMjCgGFLHrgH5ikEuPjXoDfYzRJf2hyA8Uth98uW6zujTnQ==
X-Received: by 2002:adf:fe88:0:b0:34d:a75:3a44 with SMTP id ffacd0b85a97d-3504a96a3e3mr7408130f8f.54.1715591158188;
        Mon, 13 May 2024 02:05:58 -0700 (PDT)
Received: from [10.91.0.75] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bc6csm10565446f8f.21.2024.05.13.02.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 02:05:57 -0700 (PDT)
Message-ID: <d5b179c0-67fb-4452-8e22-b3d5d713942d@linaro.org>
Date: Mon, 13 May 2024 11:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
To: Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Krasnov Arseniy <oxffffaa@gmail.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, kernel@sberdevices.ru,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240507230903.3399594-1-avkrasnov@salutedevices.com>
 <20240507230903.3399594-2-avkrasnov@salutedevices.com>
 <171517732606.1572649.16193191353725811830.robh@kernel.org>
 <CAP_G_RUdN+6OcsQZUkqWQMYoH-ZvmPnskT3yONK_YssqUYhm9Q@mail.gmail.com>
 <418e29c7-9baf-ee4c-7a24-49c196ac89b2@salutedevices.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <418e29c7-9baf-ee4c-7a24-49c196ac89b2@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_020601_716739_D8F09C64 
X-CRM114-Status: UNSURE (   6.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12/05/2024 19:26, Arseniy Krasnov wrote:
> Sorry, sending from proper mail client again (not sure it was delivered sent from gmail client on 08.05) :)
> 
> R-b was removed, because this patch was updated

Then, as Rob requested, explain what changed and why the tag was
removed. There was nothing in this patch's changelog.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
