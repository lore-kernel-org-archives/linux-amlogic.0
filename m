Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFF1C54EBE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3dJ1Uigsp6PClnE5k+HWUS1VGreqQaoEYt8rlBQvjU8=; b=X/g5sWmOBMgn9e
	7Tl/8r9OpLZtohAhJ9noxUAAdxEOOZbSm+TXGav6sSKfVPWtNikjK0tnKKdysJ7Ragz6pwfOMsWEv
	8e7ZyCHP4OUSjmZn1xHSSuokZLCECSezTq3nUS6Mi++S/clH5yki/7ShDJiwjqqi/LsxcxMkwL2Kk
	udUoQRdX7bb1jYHdRJRZ/+Vw8eK7NtuDmdyPGn+VjUDgJKPfBmckhC14PIxCYgLNUFv4D/2ZTCnx2
	RpBZTR9QpGXUQt5qfnjz2QRNyAEUh4nJfKgVD952KwQSvtj0kYDHINVmfo96458fQrrZZjPEdTuwX
	dPtlb0C71smHdqspgohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLDm-0030BA-9z; Fri, 13 Jan 2023 14:39:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLCS-002zVd-0T
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 14:38:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id b5so101004wrn.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Jan 2023 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=2ejaSnB1iatZ6NYDeZgR8Ys8saXOivDL9OIRxuhbO4g=;
        b=1FED3wJOiUsiU/4XBOp+Iew/qsd5F05j1dL4ieFLIRSoAOucms+VIRY2TkWLYK1/Mo
         C000/abxcNXlJFgYoGeAnOw0EwHqZFJsXd/o7NxdpZiGFQ2D83/R2vP1Iwy/J7zyAQZO
         /Bz7mwDgzMDdXXTn2BoE2+7ZtHpBsoFWonZ+c4ujuSzkiwdZUeSCnzDtobGpxyGIryFs
         QdWiQUOxIby/1P9JP7YAGrjvzaqWTLxXSThxMGjV4e/u2y9bqo0FywWIdYhe7bRo3/+v
         lkkwmp/VNJumPVcTUnlF651Rqb6QGfB8vQlHVhlJYaWKl8KOqfJt5TMKaunqMKYKXYu1
         AGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ejaSnB1iatZ6NYDeZgR8Ys8saXOivDL9OIRxuhbO4g=;
        b=s5kdnWw96+8WH6g9mTISeY+CnFDSZ3RPLA7KPp0Yp7VyR/OUsFDTgpBcZo4Weufry9
         YxuNixNCSJyM+zmxmcimno/EJgO8E5zqXaXQoGBSK6hxUsvpcyL+42DBnuYgb02gvj6M
         BRfGTSKEw5YrWYfwc4qZxOOEB2oHbnY+FIvToBDog2lmgz6+XyMSW0mzB8QZU4ge0HSd
         5M4uF/6+jMW8FfVSK0w1CoZtFyK8Y3VLy7O3YN/xIR8mNVK5FjdN+80qJnTBCM01FDSp
         adXyRFRly9z037ygbNv7+jhTrFXOnr++amIWiMbql/ZjX3dMQSv8bxwCtPAALdddXeOQ
         znWg==
X-Gm-Message-State: AFqh2kqL1OdPc/oNNavhqBu+dzN3wWPvIauTL47nMjIrcjltE45GUUuW
	IMygfUIKU+XKOB6k9I79REZKJA==
X-Google-Smtp-Source: AMrXdXs6wVwbGhncvBdLaUdQtZ76sjJkpM7KXwjIMOaf1uFHHJunxBWWY6eu8hoiKtY2O5CNHxNT6Q==
X-Received: by 2002:adf:da50:0:b0:242:6777:bfa0 with SMTP id r16-20020adfda50000000b002426777bfa0mr54038944wrl.53.1673620709705;
        Fri, 13 Jan 2023 06:38:29 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q4-20020adfdfc4000000b002bc6c180738sm14721156wrn.90.2023.01.13.06.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:38:29 -0800 (PST)
References: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/4] clk: meson: switch from .round_rate to
 .determine_rate
Date: Fri, 13 Jan 2023 15:37:55 +0100
In-reply-to: <20221225212632.2760126-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jzgamcxej.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_063832_080899_3F1D6A02 
X-CRM114-Status: UNSURE (   8.83  )
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


On Sun 25 Dec 2022 at 22:26, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The goal of this series is to switch the meson sub-drivers to use
> clk_ops.determine_rate instead of clk_ops.round_rate. The former has
> lower precision (2^31 instead of 2^32 on 32-bit systems). Also the idea
> of the .determine_rate callback is that is replaces .round_rate so the
> latter can be removed at some point.
>
> No functional changes (apart from the 2^31 to 2^32 difference mentioned
> bove) intended.

Applied. Thx Martin.

>
>
> Martin Blumenstingl (4):
>   clk: meson: mpll: Switch from .round_rate to .determine_rate
>   clk: meson: dualdiv: switch from .round_rate to .determine_rate
>   clk: meson: sclk-div: switch from .round_rate to .determine_rate
>   clk: meson: clk-cpu-dyndiv: switch from .round_rate to .determine_rate
>
>  drivers/clk/meson/clk-cpu-dyndiv.c |  9 ++++-----
>  drivers/clk/meson/clk-dualdiv.c    | 21 +++++++++++++--------
>  drivers/clk/meson/clk-mpll.c       | 20 +++++++++++++-------
>  drivers/clk/meson/sclk-div.c       | 11 ++++++-----
>  4 files changed, 36 insertions(+), 25 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
