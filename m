Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3122CCED622
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Oct 2024 08:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sb2tNe49TuruZWRteCRoZ5ua024IVEZztsMrGWeDtxw=; b=1W7kdfyEixo4f+
	g5rDEq41NlX2h/wm+q/xQ1/wyPILC1q1kNAPXBDofsIV+QY3zZ0j7MAiqyF8PQ5Pp34UV2L1A3RBz
	zTToEPmLFl3qHdl8m2x/alU0RjD7dgiTItDcsb/y+PXL78BpBwy3T958ndjL+IMqnmdaatQYo4tZq
	xDjp2sYdZWanHI4nq7uaCMoNKA7L7iQbvPzdccChJDYmtF3ykS4COncIm6GvyER2IQZxvhW3rpljk
	nrY8rrVS7DLRVdNMHfAQXxAohIyGKakXWLOJk8r6CeGIaF0DC77KXs/kI7zb00qPdMtgINviQhx7g
	V6l524lJvIuLdoYvA1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRfh-00000008MXm-3g8B;
	Wed, 09 Oct 2024 08:03:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRay-00000008LQs-0wjf
	for linux-amlogic@bombadil.infradead.org;
	Wed, 09 Oct 2024 07:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OjzblqqkUrGrcgPZNRxLPE0DkoF25DAjXSyZMk0r9GM=; b=baSirUfhG38bAEGFDeHbN15swI
	KX/KTZ4c4PMiRLOav6fX2pq6CVSiq9uCJZ4lDE0vyo9x/rL3GD0qUqJJO8/rmyf/FPfnnvhaLPGpl
	fiwsULCOo/JxwdAjevtN/13kEezxznu8nlq/M+fiDyVzHz0Pjqe93tNYlqZDSWJBw4pG8IrwPU1KJ
	+a+L+KiHFT8V+R4wMrIuni7C0cE6RzLK0CjH5G18Bit2O3ez6v4FtsPJ1DHOmAMDsRpKBQ+1EXOUh
	iF8iWs73HcWXd832QE49y8PavHzl+fNmiowwx0J6p8/37M7wUt3SGBTvEI1LFWG8fnes6tSvOx6Bi
	eQH2mVGg==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRat-00000004qKu-1bgL
	for linux-amlogic@lists.infradead.org;
	Wed, 09 Oct 2024 07:58:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42cae102702so52489245e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 09 Oct 2024 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728460728; x=1729065528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjzblqqkUrGrcgPZNRxLPE0DkoF25DAjXSyZMk0r9GM=;
        b=j240iujrygZg4BcXtiJd9q3tmc08fMP0Od2RROPRexf1qQY/RH+raRc190zg1Xsvq1
         bw5n828DoeBNNSzBXY4gtmHKlNeOJdTQF4hs1KGKjyJEykrUG5n/RMev2m/Ab2fbSg9F
         rZLQ3mZESil6DViyk12fc89ORHwO1J465gJ6+gvm4fjilxlpRcuSReoW9vxzuVE1KBVi
         VwppXtNTrm/wOcSrFy1ayTB1wYv7ePpwMTUIoHWAMtQkk9sfHoNQKFlgEFCq89L3PMiG
         efFpjUlBGyzKdJtWfBp0+okYJFrpk2tsfT8rOVhJOwbro9Ct24bjfQshUGLo4B5MrRhB
         rn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728460728; x=1729065528;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjzblqqkUrGrcgPZNRxLPE0DkoF25DAjXSyZMk0r9GM=;
        b=qGvwSdCP2T/jFg89qcegMbEXWe3ZkVW2boHwcHFLsxGNCERKGBe+vWKFhXsaA+IkNj
         zC94y/K/JI8KMzc1JaF888ZdcdLFziUDMDltV3WPOuTMD3lQUdW4usgGo/eryXxRjjt4
         NgJGWXIhtUtOn3WiAoy6Mie/WtxoNahLuWDOYlxWeAuvYGxKCZq/+GxqCtSfUarpBc1r
         jQZP/yraluSy4mu2k/hjA6luPYdjsKIz7OcICF4ij9Zoc4+rpaBUypNKsp710BWZ6HZV
         iGH0Fu//nn2Cqfrh+avfskLNhlOveLCf8dEDYe3EHNNIS0XBhOdUEI0NyuBqHLFH9ASv
         QFGA==
X-Forwarded-Encrypted: i=1; AJvYcCVbuzn0FzXo3YX2awpPkPfYX4IIGzk+rJuH/CccdV0qpOFaKYkcfEryN2dY8xItHg3sqGFC3Mn1MqL20lXV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8zFVqNFPDzOQ61TChENLEYSFSkCZRXiqk8/HbVDuQKVE9xlvY
	ecZKnoyWdmyVkx8FqVtTjwq0EDaO9zfZpTioNFlAlYdK7jr6SsjvtLy/OiLi+64=
X-Google-Smtp-Source: AGHT+IGkZyd5nOvtOQMkfiXw6MplVM65s68N7024BeRJ7gwwQuAN7MTfkYoNCh3XuzltFnAl7/W9Dg==
X-Received: by 2002:a5d:6dac:0:b0:374:c847:85c with SMTP id ffacd0b85a97d-37d3aa54328mr871144f8f.24.1728460727644;
        Wed, 09 Oct 2024 00:58:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d3a14bce4sm1157704f8f.92.2024.10.09.00.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 00:58:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240914-c3-pwm-v2-0-ac1f34c68ac2@amlogic.com>
References: <20240914-c3-pwm-v2-0-ac1f34c68ac2@amlogic.com>
Subject: Re: (subset) [PATCH v2 0/2] Add support for Amlogic C3 PWM
Message-Id: <172846072651.3041625.14039974148857351568.b4-ty@linaro.org>
Date: Wed, 09 Oct 2024 09:58:46 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085851_617614_DF23CCB7 
X-CRM114-Status: GOOD (  10.49  )
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

Hi,

On Sat, 14 Sep 2024 13:48:57 +0800, Kelvin Zhang wrote:
> Add support for Amlogic C3 PWM, including the DT binding document and DTS.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.13/arm64-dt)

[2/2] arm64: dts: amlogic: Add Amlogic C3 PWM
      https://git.kernel.org/amlogic/c/be90cd4bd422e8ae235f534a2fa46d40dae0816b

These changes has been applied on the intermediate git tree [1].

The v6.13/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
