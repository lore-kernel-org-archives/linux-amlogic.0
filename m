Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0A8C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jan 2022 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvTDfwfpu+RTvpqqobhvq0B9ZLk53sE/uxdgDsUzHbE=; b=mT0iHpya+dcdei
	BqxesoDSWEAgnsHIhT3aWyOIQUVAJGr88UtYAIkZmtgn/1KyzXTvC3oSTldDxKR1nGclR4vkxzEjH
	G7tfeKpUVYSjZQ34oOexhW1neoicF9FwDou9lIVhHgLKpTEsli3u3NBJdnItJIYb8uDrHKfSsG5T2
	E2XAuiw6eHWM4A0eSXDlzSHlD2yT/dX701CzRgvkWRDf94nvt1EvcqZxyjg11PkB2uXM3W2HkLDx7
	zLp9dnkkI3ChzIH4EUXOr5Zd92cfX7nJSMcrYSP7DR8e4FYhNQ+uQC/2e8WeY845Et5eFWXMVtU1g
	YBTSETrHyqyXlqPuh80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8mrp-00BPnt-Ec; Sat, 15 Jan 2022 17:29:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8mrm-00BPnW-Tz
 for linux-amlogic@lists.infradead.org; Sat, 15 Jan 2022 17:29:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D98CC60EDF
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jan 2022 17:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516EDC36AF2
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jan 2022 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642267764;
 bh=5lA2VY9bR311PFBLCn06y4hfL8BVUCwz/+B7MX0FmzM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DF/YvwpJiD6XzRpWqS78hRk2ZHZNL0piQaSetmeHtjFf3J+DRPU3OO/+adtzCD+1N
 3GdSOqmXSFvCoT4lW1ZaMlq5dijD+m3SL5o5bDvSULiWdHebKg39Yos6LnOw8if++d
 CemNboQJmYLDZtKqO3C3iwDVbPVlW0+TXCnK25u/fXH1NmJPYb2SKC4g6UhTDEeIDL
 l1vVh6GVj0y7pL1bX8HEXdDLG5k4gVicOZjASdQBZ2n2TkiGQ90ICZLxFByTiEvmDI
 iVrgcqWkDSBE4WFiZPPr8wKh7A5BUF3DMwHt9FDOHRK9taPhx8m9d3cVkgrEV2MtO8
 CSJTIm4IUfnow==
Received: by mail-ed1-f52.google.com with SMTP id c71so46666445edf.6
 for <linux-amlogic@lists.infradead.org>; Sat, 15 Jan 2022 09:29:24 -0800 (PST)
X-Gm-Message-State: AOAM531QQdkno4Ae+Fjv9Fu3AsfAC8phW3tfF6VddzV7MzKuxNWcHi4E
 M/cQ8lyjrU6QDOPJIQXIxNsmU4qrOrTbimX0Ug==
X-Google-Smtp-Source: ABdhPJxDQ9cPq17DNilAEMCjSYU7qqzqKPL027S9zuRvKb7W6VdcKaGF/3iBvKOOeUi1IEJqS7i0eDRZZO8TBFkFiI8=
X-Received: by 2002:a05:6402:4315:: with SMTP id
 m21mr13953213edc.67.1642267762614; 
 Sat, 15 Jan 2022 09:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20220115093557.30498-1-alexander.stein@mailbox.org>
 <20220115093557.30498-2-alexander.stein@mailbox.org>
In-Reply-To: <20220115093557.30498-2-alexander.stein@mailbox.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Sat, 15 Jan 2022 11:29:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKfSLb2EB4AJObPqHN7iKm555xHuiNAdmd4mu4jgW0H1g@mail.gmail.com>
Message-ID: <CAL_JsqKfSLb2EB4AJObPqHN7iKm555xHuiNAdmd4mu4jgW0H1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: meson: axg-fifo: convert Amlogic FIFO
 controller to yaml
To: Alexander Stein <alexander.stein@mailbox.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_092927_050497_011A9791 
X-CRM114-Status: GOOD (  12.72  )
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

On Sat, Jan 15, 2022 at 3:36 AM Alexander Stein
<alexander.stein@mailbox.org> wrote:
>
> Convert Amlogic FIFO controller documentation to yaml format.
>
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> Things to note:
> First of, Jerome, sorry for adding you as maintainer, but
> 1) it's mandatory
> 2) your are the (only) author of amlogic,axg-fifo.txt
>
> Please add your Signed-off-by if that is okay with you.

That's not how Signed-off-by works. 'Acked-by' would be correct. But
as the only author, I don't think that's required here.
>
> License is mandated by checkpath, not my choice.

checkpatch doesn't mandate anything. It is guidance. If you copy the
existing binding, then you inherit the default license (GPL-2.0). But
if Jerome is okay with relicensing, that would be nice.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
