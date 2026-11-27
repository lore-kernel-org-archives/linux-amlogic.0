Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE09606A327
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Paec6WG1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FoZ49Ukh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7K4NsLmWWp7dgq6Y5zcVNizOdp/XTdQpca7tKc1CGX4=; b=Paec6WG16N/cIa8RYHYbEPbYdI
	cXRHNbVe/V5QyKgn3vAXmCgaesR3amVio1gwHGX/exG887kgBLoTdXYhdLAXrrL5I14GmEMqq+aJ0
	/s9pkTMUYpeu7ZvGnQyWR3zgN7SEY9aQKwgiuwwzyc9tV+k9XrFQYkYWo2aXvlkKsQQboclhSwDx+
	swd/d93/VLlButxrzuFndXfPpKo8jGJLZaIDTTODipwnOhtZKuhHbteipbkn5c82wdNYfSXHgOQPK
	VF2BwXPBnwTFUZlQqYVJXBhJd4tuHx6F0JS+7zN7u5+urLC/sSkSdy4T7DbBysZ3FO/bKG4pmBfcL
	X4fYBfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrZz-0000000FI7U-0zSw;
	Fri, 27 Nov 2026 08:45:15 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrZv-0000000FI6Y-3Pau
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 08:45:14 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c506a231b88so1045385066b.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795769109; x=1796373909; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=FoZ49UkhLXhSqP1CCix2xLkR7lDbFIn88Nxr+x1QcE/PVs62JWJCsKxRif3piH9ufu
         QzIWB60IYVsL2QVO5U3wk0iSvRPDKPxQ3x0UDdE1Q42Pd5sPqy1rcJpKOEa9IMWLfvQi
         Io5y93vKT7U15QtPvsBeS58hDpOE+ecHvBCgFOjN3JN9Wl03hR0druf5GAPoMJMugZnA
         AAm5hFcrFgUaNsxOcEOoOjXFoygxUQmGM+qPibQrCDSw9h2c4/s3GgPUwfMtzfaRS2Od
         0w1ibiFGhQYBrGUk+4TImvz8DbAULDcHx2Ry1ual778tvS0TvLz7EdZwv9keu2z4M/Fg
         15Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769109; x=1796373909;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Dn2D8XkSGEfDxJntGFmwA2DusnT2l4fyR3s26i/q2k=;
        b=tMt6ehj5ajkFzAKM7IifFoFPxelTZ8OlC9QRSq+eTOL1BPxo3a2Bl1QgvqRGsEWuCD
         nSZC4prhxN2ZGCz+iKt9ZaGUjXGNASKS7MMg8gg8fXaaShvlUE6dBSOmOsybaiy79GM4
         DN23hkesA5rkNgzST7wGPR2ljIFykIRgTcWU9OA41NEb0uzBD9XQ07oXNR+LlqrXhIfb
         mr3FWejw2T37gTRdIxTaYy8P3MGinF8YZkkVUtA5gGaWqVwWVUm01UJ5JLmUMeoh32wb
         +dHbzsmX4Ajb0xTVaQv96iTOe81uusTH0Kikc8F+6xS+JK9X10+Hyw4HevI3XynY5YaS
         X/Dg==
X-Forwarded-Encrypted: i=1; AL+hErFMNyrmcn+hJgODqCxSqFBpdaEGrPojomFEuv3KI4RwwQzJbMI4yr62O0jP/HHh6rTAYg3mV+6uxCBKsLUf@lists.infradead.org
X-Gm-Message-State: APuU4Z/ob9aZSrZrKMJRQdVLBPtFbd33iHQn2RIkErnh4fmrjj9kS1EI
	REHspac1qjDLVw4z6bUDrkP+gNlYzGduRWpIMvlZlCld7PjtvbnOisWdFoeyniUbESbTeyn51Kb
	74/Mk
X-Gm-Gg: AZFdTZeCi4kiH42puPfNG6MnZCGWkGAyI5vENk+iqDfZYzpH2QDMN+RdGb+0jZ/rG2H
	dPfY/OBCrxQOV/iDj0WwiF7+Lcy+c7AA1OmjkriLNbXSgZ4ftv44Yes09T35VWTfORT0LNvCYtV
	ewMH9sCYNrIXV+xpM85soBESVoIawsZYdgDIq6cCe0Jm2VEJ/YSFlQSvxe5xOs183BEgrsC79ZT
	gJkThkp2KIJL7iquzFhNkCMKnkn2hUVKqB1f+fEyzU4/WSQj1k5jjZML0fMp5ER3/udMBfdobFI
	dI4XE+e8SlXpCfSsmEtE+GW5XETc0GqOTj5Kslva70OS56BQNNgFwPwFFyhvMGeNISCmK/mR1PC
	tdtEBRXHaoqW+OKIRZiSX/cIqO9UScMvT9iGeFm8G+S6B9Kfcun39Zp9lFEaLeVEFAaKEA5BLLT
	7dcWlb32iKPxHpKflpPWt8aILITIyn/E+ZOMLNUk58ZbypslntczGtiDTsbQ94F0JS4hkpPR7aM
	maJzT41tTR9jxzriiq8UvT123koV7t01FkbJ823iT2T1kisIadAxnx8xFtWTTZ00Wz2YE6CNIHa
	IvsXGQ+xsALoQeZOlsonlSb3OpwZ1nc6dT8tPc8A/5RkXLmi
X-Received: by 2002:a17:907:6c17:b0:c51:3cb6:5b11 with SMTP id a640c23a62f3a-c513cb65d73mr1971796666b.49.1795769109636;
        Fri, 27 Nov 2026 00:45:09 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm851467866b.39.2026.11.27.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:45:08 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v8 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
In-Reply-To: <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-5-1489241e4c83@amlogic.com>
 <179536111581.2728475.9919460533427781841.b4-review@b4>
 <832c4090-d6d7-4c3b-85e7-ed7dfb8c85c4@amlogic.com>
Date: Fri, 27 Nov 2026 09:45:08 +0100
Message-ID: <1j5wxi3bor.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_004511_851804_2FFCCE90 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On lun. 23 nov. 2026 at 10:48, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

>>> +
>>> +&spdifin {
>>> +     status = "okay";
>> ... as sashiko pointed out, you are indeed missing a pinctrl for it.
>>
>> With sashiko remarks handled
> AP222 does not have an SPDIF IN port. I will remove it and update the 
> interrupt number for SPDIF IN.

If you need an immutable branch for the clock changes, I need you to
submit them in a dedicated series. Let me know

>>
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>>
>> --
>> Jerome
>>

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
