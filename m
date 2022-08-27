Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEFFECAAD5
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Aug 2022 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYHRZDT09IUVsGs6+fNebNE66Mz+cIP5Mlxd8i/s4yo=; b=CpY/H7M3le6Le/
	ypqejzPF3rnn3Mtd2/NKaUNiR4OaZgCxgeUJhkIWu8Tv4INTeVp4LszEin2rDUFmcnuzTrO6TQAxE
	2QFDCuP5QPx4fE4X39hl7XARyvGE064GYbpKmZAl/x5hAcjOJSNvXCKXR8XDRsIRvuJHlvUYxKS31
	CHfMPCs7kpyjIgUYlpNZUsw8uWSli6CVGGivvmGusA4lQNYwas1krQBwqpofYsLjCoxTmHEgwjb3y
	Rknff9PjelSNFHWhCu4VmSwwisjx3eGcdUZVnJiiR4h0PWXWCpB0a+sUzQ3y1goZOCMfs72aJF1IK
	VfjazWpQWQUUEv5l1w1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oS2br-000jiE-2D; Sat, 27 Aug 2022 20:40:51 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oS2bb-000jUW-Jk; Sat, 27 Aug 2022 20:40:36 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-324ec5a9e97so112899607b3.7;
        Sat, 27 Aug 2022 13:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=a43bxgCVH3rA1FTnedAN3yus3ZoDoZPFWJOVyvSBDyo=;
        b=U7D7wNpxLoHE3MMbr+rI8SpJ5EBQd8lJ2Qj+mIFKdbfeOdxnXoDeLwUbl2b4QUe+S3
         6qeGAtj9bzKy66OVlDB64sVwXIkovbAiv68z7+HKvQv52WzbTME5yv/aL8KjAfMcnarw
         tCIExGvqCdJ9Hm7RC6RgV7AL1K41VL9Lp7Go4XDdarhrxlPOn803lG6AUoha5fz09s+X
         ndB0akjXH+LF1mCdO9NvI2ubHbre/7rbvrExPB916v2FiTQvY+hLaUGrQb7zGncLDZuy
         plUlRbv61ClFMYaFx09nRMqWdx6X5DJOWkiazYNCuHvxsqDFL8eDACvdkpHpy16YP2E9
         aMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=a43bxgCVH3rA1FTnedAN3yus3ZoDoZPFWJOVyvSBDyo=;
        b=dF256j3RKRx3M+4aZXiYKfBll2IqXhgn195IjUtKLxWC5yhLB+DeYrNuLs9y5iQX5t
         jQ/TZ2w2zXYWBecRT0iKqiSaCnxPgFbSs6ml1GjA3HqZFvHXaz1KLravWHmASm1M/qjm
         EavU68qyp9XnhOpctbG1NonLhWShpWnbqRiAVZkaZEZZQve/pI1Ggp8isTgP0BvgSEYc
         oxsGz5BgKb5lhb4XYrUFm374pdQ51O/WYNdZNkylWcGZG/mdrq5vd1eV7Ez3HP/VbbLj
         f1fWNnOMOE6z/2mRYBY8FOp5u2DDuI6cS3w19/gqOj4+GPTzn/dnAj9bp5vfhVX29HEG
         aZ6w==
X-Gm-Message-State: ACgBeo0Tjqo2DWJJuD4lOci0aTbYiubLDnqDqjto3NQlYoPUwf1cm1hR
	n+G3/+R9Bu4kfQncRADc0fRoEKNr63m7TvjbVaQ=
X-Google-Smtp-Source: AA6agR5W9bwOSWdZq6cApJvjXHDjxg1Q8AUtHvo++rxzP731ZIP5KAqE0qiM2Zw5UhXJ8VrNApYaMwOgM6p3G7fCHNo=
X-Received: by 2002:a81:d543:0:b0:325:2240:ce5 with SMTP id
 l3-20020a81d543000000b0032522400ce5mr4751398ywj.210.1661632833757; Sat, 27
 Aug 2022 13:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220825074008.33349-1-jinpu.wang@ionos.com> <20220825074008.33349-2-jinpu.wang@ionos.com>
In-Reply-To: <20220825074008.33349-2-jinpu.wang@ionos.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Aug 2022 22:40:23 +0200
Message-ID: <CAFBinCBZkGZcrR5Aue5N+=zTM2MAj3w=ox1Vu1+Od5BK39PGTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: meson-mx-sdhc: Fix error check for dma_map_sg
To: Jack Wang <jinpu.wang@ionos.com>
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_134035_712691_09923A36 
X-CRM114-Status: UNSURE (   8.07  )
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

On Thu, Aug 25, 2022 at 9:40 AM Jack Wang <jinpu.wang@ionos.com> wrote:
>
> dma_map_sg return 0 on error, also change the type for dma_len
> from int to unsigned int.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
>
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
Thank you for this patch! It's:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
