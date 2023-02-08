Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE92EC636CC
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Feb 2023 13:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmo0MBh6KDErIjvyVQMWzPfkNlNArP4Ce3nw6Fbt798=; b=ZyGpdhNeFfueIF
	BGtkSf405TcNv+HOiZg9g0hy4sx5tlxbDUoXF8tr/1/mZs/0/9yCbK8DJPt//RcIsJFJ2NgM5Zwjk
	F2sTX+9T8Soa6uAUMtCGdKT4f7T3RN91tsrWfgL5jG7wFSPsqRPZq5hpwmc8rADYBYQNN3qeVh2Vd
	MASpasewQAwOQuLoqUruYXqLGo23eEoIbqYcWGtkBoVb8/yIpUgpXjpQQCzJlLu9Zdkgt1s8NO/Ct
	ljdaPwJ2/z9XSipvlc8m2IFPfGyCgWu8Ec3ZbHSCOmgclApiLhlpHD0eu0krVgytxVrhRTFQ/VGZJ
	MrDRZ4nA/LFldp42mHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkXI-00FkZ3-Pe; Wed, 08 Feb 2023 13:30:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkXF-00FkY9-Fr
	for linux-amlogic@lists.infradead.org; Wed, 08 Feb 2023 13:30:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1468669wma.1
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Feb 2023 05:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=HpCaN7lG8XCYSDYTiFmo0cVwl51EDo9X6coy6Wp5QmY=;
        b=MhfzlfU5sY+wGQQQMW/8ySS5pdzxzPH8iIv7OSSZT231doUM5Y6Z+M7u5cZYUTnHnn
         Nwgh+CHswYjnoy3o7x1tfV/CchtnC6DLHjliRK0UiT1fiIu/eK0ZpKuKN/zYBS0W89mW
         wzcipCsUFqyl24KpdhfQ7asj0yayRfi8CgmbZ7p8sMoh1y2AcxMkGdWRUdw5Vh5YV1AR
         aV3sW8WHGpQxRjaTOLEEpIMQa5vvJOzWaRXUAuWiEY1EMXmjmLrqXqzlqcxhDtV4l1m5
         UFafj6veS/za8W+FjVLmn8AgMj6iiavpbLYgM3jxhJzhSGEmeh99X+2wysIoM35ix9U3
         SLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpCaN7lG8XCYSDYTiFmo0cVwl51EDo9X6coy6Wp5QmY=;
        b=XMfHP97gVkE9YXSvW50mOCleuWMdcCs5KmzqBJ5JtNIFpz2Lg8U5+e7QsdCR1Bo0Yu
         uKAR47c/Krta2JQTHD7d5XrQp0yEhvHsPMxcvyHQYjbF/hHK0jiTNHvTQgD4PQuxip5i
         1b29h7SkNWEs51JF7KvBE1pWqtY1KR58drzTmqJM1ItN4ZkK6oluCe7dA2L3TSL/Kktb
         Ji6ZVX9910OCmOxgY6X2mRdyurhwUsX0Tq0DfwZ0jU3xklPCBdKHhycjdFcfQEVcD5nG
         iKZ1O1Xa1fkLw77TFj80sB964R9kcqSGRaYTSK7JfNPU7LD2mJqZeaRXtSyoZAhsn9rn
         lNPg==
X-Gm-Message-State: AO0yUKXCVoFxXTnlPrlBebib+ASX6v3/J2ify5jDnSaVc6P75+pa35UR
	GL0ZAZgz0B7KNkNZcc2yt+xZ6g==
X-Google-Smtp-Source: AK7set8gTMHZ1IftF10m4fVg8A2AOT5sLEQhWbPfE+atmk79589ys3Tl9ZLjMH61OGI0Otb++12oXQ==
X-Received: by 2002:a05:600c:13c8:b0:3da:28a9:a900 with SMTP id e8-20020a05600c13c800b003da28a9a900mr6401021wmg.41.1675863051197;
        Wed, 08 Feb 2023 05:30:51 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b003dff2b493c8sm2162895wmb.36.2023.02.08.05.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 05:30:50 -0800 (PST)
References: <20230208093520.52843-1-jbrunet@baylibre.com>
 <Y+OJB7OPABnPfeq7@sirena.org.uk>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/1] ASoC: dt-bindings: meson: covert axg audio to
 schema
Date: Wed, 08 Feb 2023 14:25:58 +0100
In-reply-to: <Y+OJB7OPABnPfeq7@sirena.org.uk>
Message-ID: <1j4jrwmghi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_053053_737875_C9ED5CE4 
X-CRM114-Status: GOOD (  14.64  )
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


On Wed 08 Feb 2023 at 11:35, Mark Brown <broonie@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Wed, Feb 08, 2023 at 10:35:18AM +0100, Jerome Brunet wrote:
>> Continue conversion of AXG audio dt-binding documentation to schema
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that 
> any important information is recorded in the changelog rather than being
> lost. 

I usually don't send cover-letter for single patches.

This was originally a 9 patches series and it dropped to a single one as
you applied them. I was wondering wether to keep the cover-letter or
not. I thought keeping it might be better to keep track of the series.

If the same case happen again, I'll skip the cover-letter.

>
> [[End of PGP Signed Part]]


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
