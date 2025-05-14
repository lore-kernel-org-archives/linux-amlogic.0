Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F612C3ABDD
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 May 2025 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGaCaGjUJcbFDJ+VbLXHszAKvTTKwUhWV4R+tUhJFpU=; b=AKBHVxenubOCDu
	0huc3kwfKlu6ZaeODAtNYBOePXz62N4znVX1IINd3n6K3c1xvgTcD6j+vY3JznEXQfMi8FLtB2PCW
	sVYX3QB3tw/B3neS04mMzvE19BGV+DnvX1ElewSQ343rIQunyP8oD3amYz0mZHLaBHvVUjbS10gQm
	BzMF+dMUn5k8wvjqNY38o4xV+afCBYPhl6Viw+/AcwItrKGspADy/81E8Lk7k+3DQBi40/7SrtxB5
	OPYNwaC1vVhCyGyn+GvmU4NL2C62ysFFTuwLc6Kpp9N7fKuroMKnT0I/AN5kpB+t2SNk7jxENxgAC
	YWoyOX/yq2n7ryVQZI7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7zK-0000000Eb8x-3std;
	Wed, 14 May 2025 09:01:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Pu-0000000EUZs-3v54
	for linux-amlogic@lists.infradead.org;
	Wed, 14 May 2025 08:24:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a0b308856fso4824500f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 May 2025 01:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747211081; x=1747815881; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eedV/wY12viBVchiRE/OIP5PIpgQSrislkOLpr9Sh3A=;
        b=RJ83KfYI0Sty5Gi/rrPwkbSO2PtAhYmkPVjEmIZ/KT1msXNNpXHQXISDFW+RXSuogT
         9FQWvP5EtR64+9vbs2yUnR63ICp/GI4sIeRULJ81EsSz9VCQaWd6XoZsqYg+NTETteTT
         7UyMTJT2lu3Yt/3KCHvHE3XwMf+RQxMksjyikjUi/VnjKj8aRo6MtEQDMUd5KtLGBDUF
         H4u7xOYAsW9FrDSwee0Tr7LT/OSsmF6nJyN0NNgvcxmMWyFtIZH+9gGB45HFh8fAJn+B
         n8pQy23di55X7wWpW2p+Zcm1Fw+J8ghcYDUZvHJDV/C09C6cAy07cu0qYNDipDt0uB7O
         Di6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211081; x=1747815881;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eedV/wY12viBVchiRE/OIP5PIpgQSrislkOLpr9Sh3A=;
        b=IZulJ3IIy0yGkHU1aQB5c9AvRUmqMyK+gqJzslsirCVYJB4H5j0clNP1WczfMRb6TW
         qG6wnuKaxySgqQAIxjrxlWY3sfTAARVNcRt7Vi9jDKXsuimPxCAl26BbJbqvLTOyBVkA
         dDPI/cjJjKgbROVTEZcDuXWsU859sMvpcJ6zex5hajyDTmVua7NPrMasw269D33n5mMT
         5phls2VgLO7gGwzQi9+AeQ/dxo9puSYifF04gDEiXSMlRRRBxi9x7GSfurRRpF9bFYLb
         NWme6/mTEU966jogztIx8vrnhAZ6DBPIUtYEBgz65zNayqwuV0wB96KZ83z+GiXF29JI
         dzvw==
X-Forwarded-Encrypted: i=1; AJvYcCUghVNWZ0s1ComeTN+ULJUyHMVPObwxR/nDMs8XRwaV6X5CH7kKxcmxXdkfMmMSsOa42c1ZOTnrt78jAQ+L@lists.infradead.org
X-Gm-Message-State: AOJu0YyF8s3MsbMTWqq/qjlNG8f01E+5SsCyvY0Qfq2TMfU6j65iOdQv
	bn+owXgpVqwsxegtKi8Y16bbDjjvJBsUQ8LMo8moPzR63dF4UXEQH5ErbitG9BE=
X-Gm-Gg: ASbGncs3tRv/G07/WJARVMSGhcR0g2WQZxDLvD3Un+9mg+l7dpFATEUELrvBMgTStEy
	b1muTWvdB84EA7czMVRpaBTS+mnC5hhU13ZNv7xNlvLqjKJUjaVN5NE0t01isAPrFtb0VvcWTXA
	9PhmLC6wHtZTNyJoLUIAiZWidNAyEqdd3yQEW7U07iXTLjwVcffvJIq11d0MiO0sQ0dpfNGBYoJ
	g/2L8QiogeVaxLEk9VkFguzxnA4Eohzi2ZJti9RWPlnCJA+8YVXmzkvprsz+gmzGAg1MX9+W3ZK
	gXx+9RHvWCh45yp8KLtGZWtWgvw98RHZToCA3EKBKUKnM+Eu3aY=
X-Google-Smtp-Source: AGHT+IH73owM6GDBNU0m8kLkod6KCAbzZS7b+xGxT9afNmDlYsKih/kTTaAbX9E4I3SRCyiriIu7PA==
X-Received: by 2002:a05:6000:4007:b0:3a0:a238:a59a with SMTP id ffacd0b85a97d-3a349694e6emr1950397f8f.3.1747211081471;
        Wed, 14 May 2025 01:24:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3b94:a3ea:946a:aa90])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58f2a79sm18566020f8f.48.2025.05.14.01.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:24:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org
Subject: Re: Devices not instantiating on Alta
In-Reply-To: <aCRQqRucgWMOjUPj@finisterre.sirena.org.uk> (Mark Brown's message
	of "Wed, 14 May 2025 10:13:29 +0200")
References: <aCRQqRucgWMOjUPj@finisterre.sirena.org.uk>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 14 May 2025 10:24:40 +0200
Message-ID: <1jikm3y4zb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012442_969738_DD1378B9 
X-CRM114-Status: GOOD (  12.87  )
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

On Wed 14 May 2025 at 10:13, Mark Brown <broonie@kernel.org> wrote:

> Hi,
>
> For the past few days in -next I've been seeing the reset controller and
> audio subsystem failing to probe on Alta, I *think* the audio is a knock
> on effect of the reset controller.  I didn't spot a smoking gun in the
> log:
>
>      https://lava.sirena.org.uk/scheduler/job/1388164#L4875

Hey Mark,

Maybe I missed it but where can I get the -next sha1 used and associated
config used for this test ? I'd like to give it a try.


>
> and unfortunately I didn't manage to get a pluasible bisect for the
> issue (trying again at the minute).
>
> Thanks,
> Mark

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
