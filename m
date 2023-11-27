Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA38C0755A
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dk6HJj7CzyQYAwbNiE78nUXzCM0PHtOIJ8K7EO0bw40=; b=cb0Fgi6cGXn0Kc
	peGKV5F4RtKXGV38leEle2UHgEyH0Mkozsasoz85ceh72FNcIpLkIV2AcsyUeVINDBMGw+I8Gdn9A
	QZBSG+XHFUJMSyiznPov70Ak18gz5AntJFEFh7sDREeHdKUkOJUvbrXyPfDCMWDSccp1mtD3aWK5Q
	GbwrcCGidbgsnUydEhH/cZO3iK4B2Ub8pnZq/IvfUnHAFNPOYh5z19P3TOHjfIdobrYX46w+hD+ow
	CasQfZEYkRC8VOIqHSuJfALLq/WAuTLFwZVh+vyu/3BohGU7ChGsoDJ24E4QY/Goa8vlE9JfNHh2F
	uzFdkcCq8MBaTfNX36ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WqG-001obk-00;
	Mon, 27 Nov 2023 08:19:44 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wpg-001oOB-0u
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:19:30 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50ba71356ddso3018949e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073144; x=1701677944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs07zuoQmAQlRSgbig0SCdsAbx9/nOr4gfcDOPBJj+A=;
        b=Li+P/ELam/eLJjPqLLLQAqKgsN6iDxCtcssjxMaBwCWTfi1CvCTLYryMctWrJcLCo8
         H2hdzoZ10ABiTbGafXrCvTH7qOI/x9spbpa/06PfVllMOXfaT8nT3pbZkUjgv4bEFsq+
         friicKGE6j59hYijEMRGDl1gEZnSdnVQTyQMhl70DXpbIUiZ3Yxx4p1RajwMVEJ7SrvR
         GWxEUjIOyz484/U7ng9MBsNFQu7g+YfqypvInCkIhP20OnROfsuQnoXvJmyMj/5xEL2G
         oAd/8Bhu56dsacvlZJNfcwuqoWGhu/5GuKvQ75VnnMo9ZIm9+igvzoDmzPyaGtT/fJaF
         uhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073144; x=1701677944;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xs07zuoQmAQlRSgbig0SCdsAbx9/nOr4gfcDOPBJj+A=;
        b=DX1Goc20BeffWE3zirLTkNHXElBlWPYoqV614AWSNH4cUWrvDkOwfb0/BINo3d02ZV
         oIg8Hfjmy+hQNOVIV8VeOlhQ7ImUHJqLfIwH7cSdt5q3BzSAGaiUStN4Rv8R9g6c50xC
         bmX4KfSzRKRpV9Bmq6S4Npdo2KSzAk0JVZtAQHXSAf+PvdUO4CHcU2Twh+hypDW6q1sC
         OUVQsaW5n51KwketJ3IM8zT1B8PUTpieVaXMEhzgcCurjjO6OaEXoWLqIgoL/pFoeqA7
         nMRlcJsRAYDUb1EalEkPCxj+sXM2VuN9gYClFPRYcmhQJpQt4WFq63a2Md7ADhKY+FWZ
         7Btw==
X-Gm-Message-State: AOJu0Yw1x1oGqQaUkULH8KuqXEoEGAVy8NPvi1sQeR7Skz9+fu20ySRV
	jtNRljvT9qsO8UmsPfeaaFGUPA==
X-Google-Smtp-Source: AGHT+IGLBJFBAZK5eRCtgNcccOOkWkb/cH80/RtLQ3yUvcwtP6JjS3eHdJ6g8KAlW6EZ53bLEaIggA==
X-Received: by 2002:a05:6512:ad1:b0:509:46ff:6e57 with SMTP id n17-20020a0565120ad100b0050946ff6e57mr8815118lfu.8.1701073144477;
        Mon, 27 Nov 2023 00:19:04 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm13516568wmb.14.2023.11.27.00.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:19:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: oxffffaa@gmail.com, kernel@sberdevices.ru, 
 Liang Yang <liang.yang@amlogic.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231109094504.131265-1-avkrasnov@salutedevices.com>
References: <20231109094504.131265-1-avkrasnov@salutedevices.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-axg: pinctrl node for
 NAND
Message-Id: <170107314359.1083800.4264228970569502392.b4-ty@linaro.org>
Date: Mon, 27 Nov 2023 09:19:03 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_001926_994036_D90371B9 
X-CRM114-Status: GOOD (  10.09  )
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

On Thu, 09 Nov 2023 12:45:04 +0300, Arseniy Krasnov wrote:
> Add pinctrl node for the Meson NAND controller.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[1/1] arm64: dts: amlogic: meson-axg: pinctrl node for NAND
      https://git.kernel.org/amlogic/c/be18d53c32b2bbb211f4be599cafdb9d9ecab040

These changes has been applied on the intermediate git tree [1].

The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
