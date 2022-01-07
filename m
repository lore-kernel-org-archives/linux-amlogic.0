Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED04BC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 22:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6EnCXfn8C5QUmy6DtUo142qN0+hn6jOXM4a16qk2rM=; b=vfnXG7zmyaBQ+H
	6E8Sd8nGWSfA/0S9NLpIDt+QEeusMOONXbVTlh2FCH0ZrZFWqKml0YPl7Z+KLP3rO62F40GtJdr6l
	Wcj0Bvpn2ll5hTaUco9VoRhTghD8veW8Slu1lSoEY9fvK2ODUwRtCzQ9JEvSLVGIYeTT/n+WXTLXD
	MTUO0fxp2hYbGZalL1T/4CEjone8CZNK9htYtZHjuZ5Ve8ihAyg2RHuOgunLI6MeGyw6i14tGO2EE
	iGPBcAvHq7OHPi5Idr4v8ln5hzOAeb4NjVJG1BNnIsg//eGFpuJ7n/NezS2PsdrnjUF4+xqjgPSi/
	2I1cYayBlEJtl2TNtuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5xUj-005N0t-3j; Fri, 07 Jan 2022 22:13:57 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5xUg-005Mz9-NP; Fri, 07 Jan 2022 22:13:55 +0000
Received: by mail-ed1-x536.google.com with SMTP id a18so26237422edj.7;
 Fri, 07 Jan 2022 14:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJ24AjqJEAwaxu2m+ogOnLjEEMZgY/uK7bliZmkm1W0=;
 b=pmfhn4Ait4Dmyk1stZQDqFcMgsQ7HVYANrO8zy8yZ6ruFFTt1B8f8TWM8Mftqq2I9u
 d01Nz3x1iBns5KqiqTXxV+EB2/g+ThONesdvtOinq/FQkic/6JK1GgYq2n4jAFoM2UAb
 o2j5f8lQat0xJfrCVttBdRPGfqpNNxfW9QdCdj59kAi6BWWGfIEsV7HPHV8D1F9mod0q
 bTbwtACgMjvSWO1mnS7ZoERhExkQ0V0BCHCIHajP8IkoBVAZdnKTBLkrhYUXsZ/fOXjh
 M6Dt9UH5ZD20IxdxdXHm68Z9vmVsSa/Hy7OXXjJNIis9hduCnB8GiCMniJ+r8bv3QYlq
 W4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJ24AjqJEAwaxu2m+ogOnLjEEMZgY/uK7bliZmkm1W0=;
 b=BS+hffn54WEV8E4KOv4VD33K7aM90pKFHUc5jOCyP30so4ix7KQYGEyrr9TYgKR9HD
 J1ppnD2BR39NtNI7T3mIPzfsxXUkzjJgKx8I04UcougJzPfzC/0iexw42D8v9yxEU4HN
 QqkYgNjwYhQDrQ2snRnFlmjuUKfCNSBwwziiWSKcJhzkgC4AWcD99TPEQAkJ2V8AnC7b
 CMAt/7t2bk7K5l7i/1ve7Tckd6aCOUpXEw9x3OlKkakkUOmrkgPau07f7GFAFacQqz7n
 l9o7Z5yUD1ngAPn4rPksTUwg4zrwhOVr5cu8lmZ1jWZXIrodsxzHSRT/8NJzoiSaCaeI
 lX+A==
X-Gm-Message-State: AOAM5322dx98ybiJXEv9dZKUGJc0863/SprlBBfqRuMp+HKLORxr8MA6
 UmaV+tDyfNXYwhpSjehHjlbOw40oYE1Y6i40x8Q=
X-Google-Smtp-Source: ABdhPJxlZE8U5M+HBW8lH23GmrD0LQX5dipKcXifrGt4WjxlE7g7Qa0sbMTi3mw8ETsRuAl8A1geLSV6v9skx2rptuA=
X-Received: by 2002:a17:906:519b:: with SMTP id
 y27mr5464637ejk.649.1641593633484; 
 Fri, 07 Jan 2022 14:13:53 -0800 (PST)
MIME-Version: 1.0
References: <20220107150512.614423-1-narmstrong@baylibre.com>
 <20220107150512.614423-2-narmstrong@baylibre.com>
In-Reply-To: <20220107150512.614423-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 23:13:42 +0100
Message-ID: <CAFBinCDRx6VaaAubr6VRLnX=G4Ez8cGg-=6e-9GWrH8FwwBs-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI
 D-PHY bindings
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: kishon@ti.com, vkoul@kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_141354_801840_1305F56F 
X-CRM114-Status: UNSURE (   7.19  )
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

Hi Neil,

On Fri, Jan 7, 2022 at 4:05 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
I also found a "MIPI DSI PHY clock" and "MIPI DSI PHY interrupt" in
the datasheet.
I'm no expert on this and I'm just asking in case you have missed one of these:
Can you confirm that these belong to some other IP?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
