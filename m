Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43317C4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 18:17:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A89D20854
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 18:17:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PZ5YLIhB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A89D20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMEpNPNAd6wwHFfniAcuZGyfIsbgeafFajr4EsFOMSY=; b=PZ5YLIhBK54gjr
	GOhZMUgcWZtq1mK2yUaX3F8iLpj/pkJxnPCBG82B9NgcKcN+8Eoe1V3z05Xcti6hvDTXs6/Gn5bjv
	UdJDLZ3Qvlml88VHmj8Y13Oq+Jy9gbPJ54rd5UbK8O5N/cGB8snNiOP6fj8UvyxTiDScKDv9FLubX
	9PhRZlGKM6VuWnhKVkyq42fHfvW+c3KZLAh30/EN2r5jeCXDcRdeboFH2bqrOn3UB7x4dVe9WMXq2
	KJF67N65Af0ruD34y7s8cwL8eiz5g9+oo73zm5AWVifEsQu5nShiV1VYgRC7MuB2dvpqLgzhmYV/i
	4FyXAgFMPHYjnjCOJHHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iK4u4-0000tU-FJ; Mon, 14 Oct 2019 18:17:08 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iK4u1-0000sn-Ov; Mon, 14 Oct 2019 18:17:07 +0000
Received: by mail-ot1-f66.google.com with SMTP id y39so14597591ota.7;
 Mon, 14 Oct 2019 11:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ckXq7H/VDyEuDBGMiSrOJq+fYS3KZI2dTxrNxPrWB1k=;
 b=JcRQHyo31/IM+DB8JYt/d5SYsz918FAXcHQlquHxmI5UcLUUgEjZ65eWM9adRo6Nnp
 yNJopA4N67sFU/FJbuDD8K0GQbrheoob9jHXZnbCao/S89SGC58LxH5NwI0sZ1TeE7I2
 t3001iwjRcHellXQqJx6XEBVcqmDeu511d1D2BCnu02FrpC17rtnHMw0OjdFuAeeg61f
 adnjXbJIeXo33wGW9QWnF8BZaDc3aU7u66wmd5n7nP9oN/vhZbFotLRY20e7IIrjJ/97
 lo6UoagKkIG29+k1BU/XCbHTJ9BIUtEifPsQfY4vsazIPDi2mkr4xZGrxPh64yegJwr+
 bcug==
X-Gm-Message-State: APjAAAUtxbEB94I0j4l64oIYfX2Q3SLHHlDS+kihwLqXkesAlNHJ1fhQ
 uATgHbG4hYxaOpJSJ+XfeZrAeXc=
X-Google-Smtp-Source: APXvYqykid9kSCG1CYJVW2KOEUFr4Yc+gJ5hvhWeq8D1eMHp1wcYxUdLkGAG0vEh1DCoe19itZwiaw==
X-Received: by 2002:a9d:58cc:: with SMTP id s12mr12635611oth.291.1571077025089; 
 Mon, 14 Oct 2019 11:17:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k24sm5352026oic.29.2019.10.14.11.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 11:17:04 -0700 (PDT)
Date: Mon, 14 Oct 2019 13:17:03 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: Add DT bindings
 documentation for amlogic-crypto
Message-ID: <20191014181703.GA14399@bogus>
References: <1571031104-6880-1-git-send-email-clabbe@baylibre.com>
 <1571031104-6880-2-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571031104-6880-2-git-send-email-clabbe@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_111705_810378_00791D83 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 herbert@gondor.apana.org.au, martin.blumenstingl@googlemail.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 14 Oct 2019 05:31:41 +0000, Corentin Labbe wrote:
> This patch adds documentation for Device-Tree bindings for the
> Amlogic GXL cryptographic offloader driver.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
