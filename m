Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0542C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 21:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNMyGRV3VqxX5plUaztyixGxKSJgH2W8sjOzr7khLsc=; b=oCKdYq7RKMwMRT
	tscA48/Yx7+xRtU95ZppoiTG1zMtRRkZ+MGWNzA8uG1G5e0VwC4q3eyvV88PfQ3fCz1pjrsrHF9RR
	UgVZXGM255NezJwppe46qMzhPomqNCiJqOdRBvU0HujNx/2ZF9aOdDouysa2o8H+RtYRpUB1GFqZg
	wqCBB8VFZgCI+I928PNW3dI2e7CQdOTfuN1ao230aYgOd8jogXjVuap5XJzmmwlmZQkplZtgO8Dym
	JZdBoBKyNYnrJPtjNjUVGM1UE+9NmpDYOhH8foymyVnkln5lHKQQthppYLSWQUoxHFQiDI3deMDvx
	5lbr4sFRPXJRA9un2Lig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5xES-005Jnq-OY; Fri, 07 Jan 2022 21:57:08 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5xEP-005Jm1-U3; Fri, 07 Jan 2022 21:57:07 +0000
Received: by mail-ed1-x531.google.com with SMTP id k15so26951617edk.13;
 Fri, 07 Jan 2022 13:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJxRNYRzNNkqjFe/hktJforwUgorgEb4Zywafu/Jhjk=;
 b=itnTJTnM2Up3kdjCIHNH5zJPK9Q/5I9s3ZAFX0P9KOdeUMqTw5V2ro5qKubiTUydQE
 3Zq5xiB5pnnmr37xJ1NO8xi98v1mwZ74QJh8agjY+zfCzCYoc6Iabqb3p0PH243aIiiz
 PQVeHxefike90JsZez4SDZveskBbTcarAgP04i7ZNg0SEzVPjZpi2HfrnwPBpguX8TxF
 sFdqU4CGXFHq+Q2HH8LHdQtzARZxd2ib36F98gJ4Fvjz6De15r47L4VxxWp9qgrADKQE
 htpvDMrlVQcztDvmxsY+x66U+da3vt/20xFHNemDpnpEYHIePG/AMDv0hET0/z1lhXj/
 Vc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJxRNYRzNNkqjFe/hktJforwUgorgEb4Zywafu/Jhjk=;
 b=yM9HIrpFqYEkk1ZXSH3IR0aP97frVYFp7+iA7E8NLBnJuaBuzkrd9RH+lhrLcdONff
 Y89CK3xacIBvzklGtVDMQpU2vRIY8X3Rq8kk9lc6j3keidizqtqTLQfHGh5OXZ50Y4Ab
 35v2yoMbkg0Tw+T3zrAgFol7r6YTrJ5xMBSZzLUx5nSom6h0tPLNs6FyqG02lwN6haiD
 VlteCSs4lBR5WTM7n67Mt/3jv4h/UHHu/CE38mkFG4CCEsK1TGzFQ+eiLvw3d2kaH9vu
 WKm9yUjozdWOwMqda1eAv8WL13peLV89bqgsV/NG1gFtdes4awigDbx5nroHP14eOgoj
 uy7g==
X-Gm-Message-State: AOAM531XHnF7sKtFvyvT0i+G6dB5OqTp0uOB8l4Lbm1+B5B7xpa4GF19
 73VBAeKoTfWphlSc0iw+/+7tCgxUm/2RPTQpSEA=
X-Google-Smtp-Source: ABdhPJw9LQk5Y9g+qc0okCpO8oOdvPbFrEB4gik9GEK71+mw969kHOZrkB52XksF13OPKMDsQx3WwgydLAgkPLcWjwQ=
X-Received: by 2002:a17:906:b00c:: with SMTP id
 v12mr17527543ejy.543.1641592623608; 
 Fri, 07 Jan 2022 13:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20220107023931.13251-1-zelong.dong@amlogic.com>
 <20220107023931.13251-2-zelong.dong@amlogic.com>
In-Reply-To: <20220107023931.13251-2-zelong.dong@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 22:56:52 +0100
Message-ID: <CAFBinCDrfpjCDu4Atwx9n0KAafDyCQnBSd5fNFV5NgM1xgU-NA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add compatible for Meson-S4 Reset
 Controller
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, khilman@baylibre.com, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 jbrunet@baylibre.com, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_135706_011678_100581AE 
X-CRM114-Status: UNSURE (   6.62  )
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

On Fri, Jan 7, 2022 at 3:40 AM Zelong Dong <zelong.dong@amlogic.com> wrote:
>
> Add new compatible for Amlogic's Meson-S4 Reset Controller
>
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
