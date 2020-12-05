Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92350C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 12:03:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5133523106
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 12:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5133523106
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AFIGtUqhf8H39qSzi8i2dHgsXHJPfhL8rydFNW2XB6g=; b=sP3eRfNp/RC9MBThZKEeTBzay
	KnSIex6c93Nh/sFWdYaPVTi5NgCCEQ618isQFq4edIUz8HUCMR02kYx7g+7dAnt9xTL67zn7TJ9Nx
	xSjGC/cb8a9SzGrle0YQQcwPE7y/49Aa6CkghbSYe/SG7DQVPdp9sR58iyUOPjo7jBHCNVrldnCYv
	r4yVQBVm0uvXKMVtGs6Ne4CAL8pcFf+Pj6zJOnbMw9P2Oc1ne5VN/sF+JS5bktMLiNpfcIZedkQef
	MS+kHyq0t7ay9ZZ6CJCt+gTeObgSLM3GSmb+r7yzai0+XV3+u6VCUU9QsETsPOOHjJZgcMDAv/Tu/
	BDfNIZNTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klWHR-0001Ml-4i; Sat, 05 Dec 2020 12:03:13 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klWHL-0001FB-Ro; Sat, 05 Dec 2020 12:03:08 +0000
Received: by mail-ej1-x641.google.com with SMTP id b9so2265278ejy.0;
 Sat, 05 Dec 2020 04:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P+Nd8+nofEfkgv7RY5TiH0dbaZKmUKFTlo9WVvygj7I=;
 b=UEiEDDbjRr3k5Oif/EZAaZRuWvrt1nF60+g2LS3O8Y/ZmgLdv00tsKhe++ekrPHDsT
 HkEKWp8WE0dyyicxhKGuXTpBen5g7PR95/FVtFhbxTybBkEs6oCxqmXCcSAygRbOSJwv
 nAXY18W5ilEja8BnNfRaaWvh7TSGWwlBeaSfCGEjcI/0AFSGy4Fqw5nSYug4h15ihpuI
 aGigkZYyagIvyU5WBGz22ZIRHoUA9m7qEiYrgKiz3WbWJsX7GCAEca9nq45wrZO26vNA
 tmfMXDYudEVzOlwIQ3cTNOD5oegmYGrsWgtQwTq42PdR4jn0cfrhcJm/fYvUJa8ZxWwF
 Gn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P+Nd8+nofEfkgv7RY5TiH0dbaZKmUKFTlo9WVvygj7I=;
 b=XlPM92GbSc5ddn+OcYUTAk6++/zf13BSU2OcrX2vesegc7R2Tzlfsht1+jcguKOdxB
 VPE83A1Bv4nPxsX9EvCuU/srYHO99+dpbGzfdX1fT27X6C0ZKU9CFMlW3qiMpMDBBGZy
 Gl0jgIazXNfbG6k+zyMFFd+NaM3PaCiKZ0+Lhtu/pCWV9R5DYWq9EH7ffmFbB9KX8QTr
 4GsQqGawNac4Wno4ZRXCT3OsrrpfoHHwd+aOVK3O6RNIQ0itRy03W1I1P/WCQv+soUdS
 tM82lpllYcNNq08ZjUphARsBJD/5Rxv8d2C4CNHxRFNbnNVn/OiYavJUKbdKOzdREjWU
 lzkw==
X-Gm-Message-State: AOAM531GgQhyXcKbCWSBCFNOeGBVxb7Z4t5cMxhAeqDvWiaDYfphuLMh
 Hhv3f6L8AsyDYxvzQGWR7/xrNnEi4+PTHvDajc0=
X-Google-Smtp-Source: ABdhPJxEeR4LSHPCH3FbOfM5VPpQQVWklnI1NwWuK8bcagmOklydL7dULL4rnPTjYLP1j3hih01YhQvHjd+mbNPZa6E=
X-Received: by 2002:a17:906:3081:: with SMTP id
 1mr11751630ejv.162.1607169786456; 
 Sat, 05 Dec 2020 04:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20201125024001.19036-1-christianshewitt@gmail.com>
In-Reply-To: <20201125024001.19036-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 13:02:55 +0100
Message-ID: <CAFBinCCQ0Zw=FB9Oy0ZnP7V-n7jvO6q9sgfV_51sC88Kq5iUpg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: fix spi-max-frequency on Khadas VIM2
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_070307_932806_46550587 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 Artem Lapkin <art@khadas.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Nov 25, 2020 at 3:40 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> From: Artem Lapkin <art@khadas.com>
>
> The max frequency for the w25q32 (VIM v1.2) and w25q128 (VIM v1.4) spifc
> chip should be 104Mhz not 30MHz.
>
> Fixes: b8b74dda3908 ("ARM64: dts: meson-gxm: Add support for Khadas VIM2")
> Signed-off-by: Artem Lapkin <art@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
