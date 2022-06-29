Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE4ECCA47C
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jun 2022 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/XrI452oE05pOVVEdI07TFL232+BG4rJ6v3YNe5nuA=; b=fakEdmM9nZGrds
	qjGTBQ7AyJOblQBTyOqPFzj8HCDV2vUBFdAkzzqVWPi5m66luapfuyYjOpipnqTITfEhyG3iSeFc1
	S4jNFzorFfi/GasATHN9TUUt0Qb/rE7R7wDp/Og6EjH/FujP50OKn3KKBSjvydS+PpBkHCGB8D9wP
	4u9V5EqJLvcx2+Gskdo0RIEVdfOKh8SGDq9L3xfhB3D/94bvO7uOVca5JeA+H9TGZ7Yaq4LcBp6ov
	mXLHFPHjxR2cjUPKMySAFcelyyeuafjN2tLE1aZ7McKYkoZqeyDW0vReC9tLI7yPphO1UoXBIJljO
	27fOIHAAgQ6FfTiQQmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ZAK-00CcId-3x; Wed, 29 Jun 2022 14:59:40 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ZAH-00CcHj-Fq
	for linux-amlogic@lists.infradead.org; Wed, 29 Jun 2022 14:59:38 +0000
Received: by mail-ej1-x632.google.com with SMTP id ge10so33159051ejb.7
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Jun 2022 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TsyG4q/xF+q4jrUA2VTKKCJE7zAVddwGIb9EBb8KNxw=;
        b=SYRgzqNQfoKncnUD3dWD1qMgms4bsuZ/5NN0MsNS6AGn0mU0OknapuhDsq6Mq+rYRH
         6WQn8HKu1xZM3ZaR3WUXALau7JBXqcKWEECExvUDBjOOeWC9slJkssCMLH4pd01cUzqw
         xXdBKho7RzvleJlpQvH+78mXybQzoGd//YYcJT8WaPDzMQl+UC3ii1HNLOqNcJHOiq/9
         dOp53GZtW6270f4o4FsXdFbBOjgGnNezsTaYNaAmjUEFIVQXOtl8WySKI9morMytvbOm
         D5tZ3fnOzTqln83Wud59vIEEoUp7JjYjeIaJ22q0RlnBy+S3Jl/byqZ343ZLu/uMl7MF
         I+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TsyG4q/xF+q4jrUA2VTKKCJE7zAVddwGIb9EBb8KNxw=;
        b=W2kOgzRKg8RHbiUE3a6zsRBRr+XlDsc/v66p3bWFte8Ir+JPJKMcXghKSMvXokI8wB
         4LAwPnASiUhhmh32KCvf5geEJqFU/bkf43OO5eD+HQZUlg3L5tX38bFGaIAW2C5CX/Ni
         26fooXwdUpBh1hS0Nkx0b0M8SQYtQgkOPH3KTpuSFEEg5u8mHMW+o5MWoEH8qt07sDz0
         ewQUMky4qHs0A7j54ehXcsZ+2FzKxjGOLeWlDgWkMW+HVN8UI+Qbjyii+I+DqDoei6MF
         XVJ62ryeMOzcQp0UNU+1pLft9s6EpVVb5m/YMDcfCnmNRd5PyzJZ/zJQOImEzQTdObtA
         W2Yg==
X-Gm-Message-State: AJIora/SmLpi4mDkLuH8mg/1y12Ui1GHtI4WE/cgUyjt/rr9zykAft92
	DlPq3FtE8VI0Phw4YZwFxPcgwFTam/5CH2dtbJE=
X-Google-Smtp-Source: AGRyM1sVQxNfUe8lk7CTdDAdBuh1kYb6B7kaLrg51MwdW1PWgV3C0umHoVyIz//DYgaRToGiLYTe0MpQH+WyqoaSsZM=
X-Received: by 2002:a17:906:7a0e:b0:722:e8c5:ee96 with SMTP id
 d14-20020a1709067a0e00b00722e8c5ee96mr3754828ejo.147.1656514773127; Wed, 29
 Jun 2022 07:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220628141038.168383-1-windhl@126.com>
In-Reply-To: <20220628141038.168383-1-windhl@126.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 29 Jun 2022 16:59:22 +0200
Message-ID: <CAFBinCBPcrJZMXAtOjRZ6rJ0H2u7aa6=_kr2=Zb+TRroR6cdQg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: meson: Hold reference returned by of_get_parent()
To: Liang He <windhl@126.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com, mturquette@baylibre.com, 
	sboyd@kernel.org, khilman@baylibre.com, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.co>, linux-clk@vger.kernel.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_075937_582875_B094A480 
X-CRM114-Status: GOOD (  11.20  )
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

On Tue, Jun 28, 2022 at 4:12 PM Liang He <windhl@126.com> wrote:
>
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>
> Fixes: 88e2da81241e ("clk: meson: aoclk: refactor common code into dedicated file")
> Fixes: 6682bd4d443f ("clk: meson: factorise meson64 peripheral clock controller drivers")
> Fixes: bb6eddd1d28c ("clk: meson: meson8b: use the HHI syscon if available")
>
> Signed-off-by: Liang He <windhl@126.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  changelog:
>
>  v2: change the name of 'tp', change the title format, keep reverse christmas tree
>  v1: hold reference returned by of_get_parent()
Thank you for these changes in v2!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
