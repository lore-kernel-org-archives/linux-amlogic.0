Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F634FA3741
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 21:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6KHBb4mld6JbWbacSEN83OKCo2C2kHWl3ymdGnZXCs=; b=EOb6FObgpjPW57
	4neuvHlNSVbnbhgz4BJK/xxvJrwJ0gcYHQ01zq5SZkKtXX0T1Z1q8z30L+g3qSlBCfzVkIvrShsBy
	rBTfOpM5emozGgU7RNJ8NkjtKNQt0zQqdgECOCyUASZdVoCBbzZfxJDp4AKeW3xMTj4moqRfF3TFT
	TMBloHUbGMd+Wd4H3RVNduefwUaUtt4EJ8pFOT10holOVmNhTW2ZufIexIhr5Rpc/ubvRUKWq0Vjf
	fl48r4XRzxo0S3dP7GQUR8MiypXYgaH5AtYK/ln/IWQoG7zhL/sihcu0vMjH7vx17ialnkYD1pVXU
	GVWMLtQ6Gx3bSbndCaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opc2Z-00FPe0-Tg; Mon, 31 Oct 2022 21:09:51 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opc2O-00FPXr-VD; Mon, 31 Oct 2022 21:09:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id f5so11030153ejc.5;
        Mon, 31 Oct 2022 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J/H4zqvSpNZbUP7OdRkQB5ulns/JJgEm2p5HDGl4vr0=;
        b=jdQru/ANuLfpXnbBWcPf+Hnh1EQl7quPemjaS+7RJyGqhJwwB6igUuSq9pNxYcak0A
         O0nU+ktQjuDbpEPhSNuMVISijVcd+pIqtLohl/p0ipwDMxlxu/kPw1UKYXC9AtARimqh
         gOdvhpfEA53WAhFgMb0x3OQ2og6243Ss4vzxwpbFzmrCXZ+akwiLuHMgHFE7Nq6QAvxZ
         RWt4SDvHeG6V0iGYZUBbIa2fDRVKuFVryFwygqPVV8OHEkLB/3JPy+4NUwLxouKhDe9C
         nYvGm5nCci9SEfvVOQOPKfIBUcy4654RF5o2cE3b9PaxeCf+U2MrcosGsShH9K4TNIwL
         lBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/H4zqvSpNZbUP7OdRkQB5ulns/JJgEm2p5HDGl4vr0=;
        b=UweefJDVv9kh/kF6aXGJCxbkj8Bk3hp9TnOZTouZObt7qi1M/AJVaF+bqVfNxfelMy
         LB+izRhqZ66w83DMvPcggjr522t1W9D0EwNEbOOr3kyifrxJw3DiXsd6S2H0cRT4F05I
         v4UZ2uICOHAbukzbJJwbdeoTLNkoMsyMRovnXvGaAJbIfEBXjkkAyT0cpAJbCJo6mgMC
         W6RAG8tDoQBI2cs1/0CgwIoapjA+YYRCv+Sy6PKX0f8HjCtk7jTVy35azUPoVe/VCzrV
         Qw+vGvw6IwBnt/HBGFoucMn24sm9i05HXk4bP3c8xUd+TuTi4vWofi0rPS+N2yJk5Cac
         yqvw==
X-Gm-Message-State: ACrzQf3wZrMvSamoVinmOeye/f+FnFKLwp44YD+J5Dzs+xFWo52Mq5pi
	W2p4D2FlgFWXhtMOWtLxNb8X65lP0y5pAUFLGSnqt/3KNmU=
X-Google-Smtp-Source: AMsMyM5+ph4B22ErqbAdNIR0yHm97b2v08YYH+tQJokufHWxnNOdwM3zHZFAfKxK7ZqKFho9BCmRd/EZctEN/41ixx0=
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id
 d1-20020a170906040100b0073daf730b78mr15533535eja.122.1667250578007; Mon, 31
 Oct 2022 14:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221031091918.531607-1-pierre.gondois@arm.com>
 <fac3eae5-687e-9eb0-ddfb-c659d3816d81@linaro.org> <3c54db0a-44fe-ee24-1833-7637e249ec79@arm.com>
In-Reply-To: <3c54db0a-44fe-ee24-1833-7637e249ec79@arm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 31 Oct 2022 22:09:26 +0100
Message-ID: <CAFBinCBi_xT-pgdMSROHyZUfyZZE33S2YXczr9ijE52AfQVYHQ@mail.gmail.com>
Subject: Re: [PATCH 02/20] arm64: dts: Update cache properties for amlogic
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, 
	Rob.Herring@arm.com, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_140941_044201_35FA0104 
X-CRM114-Status: GOOD (  10.64  )
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

Hi Pierre,

On Mon, Oct 31, 2022 at 2:33 PM Pierre Gondois <pierre.gondois@arm.com> wrote:
[...]
> To avoid cc-ing people to DTs they are not related, the get_maintainers.pl
> script was run on each patch individually. The cover-letter is at:
> https://lore.kernel.org/all/20221031091848.530938-1-pierre.gondois@arm.com/
I think Neil's question is the same as mine: is there a dt-bindings
(yaml schema) change for this as well? The idea is to alert people (or
let bots alert people) in future when adding a cache to a .dts{,i}
where the cache-level property is missing.

[...]
> >> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Your patch looks good to me. We already use the property on the 32-bit
Amlogic SoCs. So please add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
