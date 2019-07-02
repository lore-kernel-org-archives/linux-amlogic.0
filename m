Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A147DC5B57D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C24E21BF6
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z0sqzDV5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fqxKgFLt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C24E21BF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cwcPXtdL/bd7rummPjZ8mQWSCs9HrpqhuPgVHJ95bU=; b=Z0sqzDV5GnLa/s
	E+DwMK6yHJJVTYJPVFZG2VKmrjTUJ21QSgBa4KR0Vn0F1Khu1Z5FAjJwGsKRyOyaPpB60J1wfRBQJ
	CvQFT0IBThFuPXN2Z1as5dlrVPAjJhTJx0KAGtnts0ITSETxCm9e3SiMM2arBV8fyDtpYX5U8T7db
	yoFOzDYOrmSVY/Mz4DMofu/ExDKqAS5KmduYTOyfAZhDs5KNdhpwPf5k9eEoU1BPbn504RtT/gmfS
	Lwn2W1oxxJX2yvAhQkqd+XjQNxocn5tCQxU1Al2wE7/Acrc/dZeMVI9atGNCAOWrGDhDg/XFA3+EI
	MTT9j86YNOpAG/Vvrr/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiSTc-0004wi-QT; Tue, 02 Jul 2019 23:46:20 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiSTO-0004lx-OW; Tue, 02 Jul 2019 23:46:08 +0000
Received: by mail-oi1-x241.google.com with SMTP id w196so477648oie.7;
 Tue, 02 Jul 2019 16:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOTP+ZaLmXyKKyNKXioW6RTool5zGcTlIioWS0XWh/0=;
 b=fqxKgFLtXz/y3i1XJccpf1r8OEVcFBvDBBeD+u/RiosA2OQeo7s6BpIY9TIOjicG9c
 U88HeaU0Ng/LvQaa8nO7Gv/JnfcgGSSbkhzU8g/92RM2NjgO3h9s93BEqVr5Qr1zjrJn
 q8ByxOhcpNXhfQxpSYR7QsG1SFw4oiONM3xTXEzkZd7PzfxXzh9qX2lSVWFXnfOz/fkW
 SD+bw1p0PshSoyG7jMoVbs8WZ8s5ChDT2fsDrlSnwDQIQXgHwaaEi7YP+Qh193HO4HnN
 +u5d9y8u8Ts7K9Nz5GDSvMbTMW7SOHnXfA6JoMcS0/s3jyH3GK/7PJZWH81Bzzk8dQK/
 OvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOTP+ZaLmXyKKyNKXioW6RTool5zGcTlIioWS0XWh/0=;
 b=U5UT2N2MKU5T1dXZb92VtWTNSdF99cqD4Cni73rJaGjF48UjQHyhiJEgNdG5CoPeyH
 xtwewKug6YCFzaCZL8chz5jF8Oj5iOos2QNPkf1Tfw62ojQl73czPHGa6Zhj8lqkeOgu
 tixjP89fZUPrwKW1CNNFfXO5DXK+l6EkjKyQWUddqUqKp9bEvyT1iSXRkXjJLNbBU+ww
 XWb469MfVMH00biFBvgg6kFjyVqUoq3Mg2iXDIVweWAHyEWMZzn2Y9qCG3DWhnxtW3T/
 65R7Bd5hiuwyi6vTTjxhYhlxokjWqezhHe/Sox/3uwBfbJ+H7OLTGC362grRmZJoftd3
 cjUw==
X-Gm-Message-State: APjAAAWxBk7fo2dQFVOtRRThYuJqpDytbHg3jHO6PFTX5cIjN8idxwxy
 PjkY9r9Eyu0r3zPQItnHbxaqP9Jl00mKauS+Nxg=
X-Google-Smtp-Source: APXvYqwD5pAmB4x2ApOe+c2vc+d9pRDSp0daWsi8O5RWBkaiMnmqlFRjUobb+dXGUccoH7FswIqUb6z3GneFdMYr2Qw=
X-Received: by 2002:a05:6808:8f0:: with SMTP id
 d16mr1528711oic.47.1562111165901; 
 Tue, 02 Jul 2019 16:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-15-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-15-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 01:45:55 +0200
Message-ID: <CAFBinCA5-5kbD-0e7Lm7FwRneWsKeW4yQrucd1PAk=s2PrtxJQ@mail.gmail.com>
Subject: Re: [RFC/RFT v3 14/14] arm64: dts: meson-g12b-odroid-n2: enable DVFS
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_164606_803294_391DF1EE 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Enable DVFS for the Odroid-N2 by setting the clock, OPP and supply
> for each cores of each CPU clusters.
>
> The first cluster uses the "VDDCPU_B" power supply, and the second
> cluster uses the "VDDCPU_A" power supply.
>
> Each power supply can achieve 0.73V to 1.01V using 2 distinct PWM
> outputs clocked at 800KHz with an inverse duty-cycle.
>
> DVFS has been tested by running the arm64 cpuburn at [1] and cycling
> between all the possible cpufreq translations of each cluster and
> checking the final frequency using the clock-measurer, script at [2].
>
> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
> [2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       vddcpu_b: regulator-vddcpu-b {
> +               /*
> +                * Silergy SY8120B1ABC Regulator.
> +                */
interesting that they use different regulator ICs for CPU A and CPU B
the public schematics confirm your comments

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
