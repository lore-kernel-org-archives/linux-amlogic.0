Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CC7C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Dec 2021 18:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGTz2pP7dIMPAs8BM9Q9v9lO21djhHPay/t7KymNAEE=; b=ERmDBrU9sYh1as
	LE8irnNIx89eam/v4fm7iipzFcBNkfOcIv+NsiMYthDqLhi+It4GsXfU++hwjKVb6xC6GHEgnyljl
	ZQsy2/E78bqsJGtI7FwOHHs/ZKxTxgPppEvPVKOHSF40n7CW32GugtBKqVTu7SzE5UoSICXWBPGG2
	v708c2PQTKEFOoc3LTILPyPV8ICNyy6KzXtIK3Gmoo9dCdnQtIas6JhR+pBI5LYJSlIu4LReF7whC
	iM+cw/jq5RMQiNW34bvF5SLsviP9UztAfkk9N1uBTjYMnNBsC6Ysd68KtJUa8sH0zKpQX09d+q5NS
	gLiKRT6uKHwF7G7EEMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n065v-00B2di-24; Wed, 22 Dec 2021 18:12:07 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n065s-00B2ck-1T; Wed, 22 Dec 2021 18:12:05 +0000
Received: by mail-qv1-f45.google.com with SMTP id kd9so3021167qvb.11;
 Wed, 22 Dec 2021 10:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OFOeNc3Y0ndz/EXm1f7thJms/RZmhtXvY2DccU76yx4=;
 b=DONX+a1rZyRBII3aGOW7oJXSTnMnUHtVYlZ3GEzGUAg30eR9CxApKYPKHqUV5aTNCE
 cKt6GhE1WTwxP+zG3gXAOmUxSj3Bq5iH6LLBAUwk7pTN/st/wW1v9GsK66n22nFbMRC3
 W3/GZ6cumZGuWVmXvcu307+SdsGHXRBzoaaqLRohIvi5S2LgwCrCX58R99l4049kNLWW
 unHOWxnLvjIKZTb2n5Wnuu88aIMFIZDtMOaFZ1HZS/MSvFOIhOkRkWUycEgojh/2n9wR
 +R9vLwvBKQTDLd6IgF49aHhRY3KOwtSOO4yF03dR1FVdKk3qmzVLjx1kDvO0c2oF37t9
 c2qg==
X-Gm-Message-State: AOAM532/uQBpR9wcix1oXf5/a4W6Fzz5YtlWZq6F61v9DEOrYKjloCTh
 joOhzSCEvaUsBs5XldXUdgp4VCE1RUgz
X-Google-Smtp-Source: ABdhPJzGakyluSdij/OLglbf0wU9LSPWCjpmjuvVW4JZ5+JzF9r8FSIgVMpgGjbFF+FN/XQXb/CvnA==
X-Received: by 2002:a05:6214:529e:: with SMTP id
 kj30mr3461167qvb.117.1640196723101; 
 Wed, 22 Dec 2021 10:12:03 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id x4sm2313380qtw.44.2021.12.22.10.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 10:12:02 -0800 (PST)
Received: (nullmailer pid 2436857 invoked by uid 1000);
 Wed, 22 Dec 2021 18:12:00 -0000
Date: Wed, 22 Dec 2021 14:12:00 -0400
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Vyacheslav Bocharov <adeep@lexina.in>, kelvin.zhang@amlogic.com,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH V3] dt-bindings: arm: amlogic: add S4 based AQ222 bindings
Message-ID: <YcNqcKWJrJS02nkL@robh.at.kernel.org>
References: <20211221030014.434-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221030014.434-1-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_101204_112609_1ED5A8BD 
X-CRM114-Status: UNSURE (   9.97  )
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

On Tue, 21 Dec 2021 11:00:14 +0800, Xianwei Zhao wrote:
> Add bindings for the new Amlogic S4 SoC family,
> and add binds the compatible for the Amlogic S4 Based AQ222 board.
> 
> S4 is an application processor designed for hybrid OTT/IP Set To
> Box(STB) and high-end media box applications, with quad core Cortex-A35.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V2 -> V3 : upate author name
> V1 -> V2 : modfiy soc name S805X2
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
