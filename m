Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D709BC00144
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 09:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNEb1BOpF9tEjOgH1sY/uEt/HnMTFF5CHLKG9BjuZ1A=; b=wfQJsXGK6kfn0I
	/+4i0J2NTyZf0Y4B7x/8yzykem+pQG5EzljNz4QZfARS3T32JIF+PvGdzyWaNrBvkaZ9uYvQMUDQG
	QUJWzKWB92uJVKe7sTsGfGYIfUdQszwBpXqDuQVi4rt1pBN1RCk4dqtgnuY6Ofb7Ju93uvrS6E62E
	+rPlJdvQBneyA7ymywC5z4l9Ov/fiKV8SAGDNmT/NM+/6hqYFNtwtvN7lZ+ylf9IDI79kHKE1kdcg
	G/ujsImbtUYAHPf2DKTq42DNt2lqytaAR2ng5f7+r3Khm177y2iU1G4Y2Jepov5ZuWySEy39GEtT2
	SrthnVTM4QYJZrZHC0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLqh-003Zej-Ql; Fri, 29 Jul 2022 08:59:59 +0000
Received: from gofer.mess.org ([88.97.38.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHLZT-003P5F-DU
	for linux-amlogic@lists.infradead.org; Fri, 29 Jul 2022 08:42:12 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
	id D5EF5100075; Fri, 29 Jul 2022 09:42:03 +0100 (BST)
Date: Fri, 29 Jul 2022 09:42:03 +0100
From: Sean Young <sean@mess.org>
To: Christian Hewitt <christianshewitt@gmail.com>,
	Zhang Ning <zhangn1985@qq.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Message-ID: <YuOdWyF2yJVhh415@gofer.mess.org>
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <b094bf45-ad7e-9e42-89a6-bae0b8e4aae1@linaro.org>
 <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_F809BC863B83870BBEB1EF76499B3969B607@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_014211_637209_0E993523 
X-CRM114-Status: UNSURE (   8.34  )
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

On Thu, Jul 28, 2022 at 07:48:57AM +0800, Zhang Ning wrote:
> Christian Hewitt told me to split to 2 patches, 1st for manufactor, 2nd
> for device, how to handle your Acked-by?
> 
> btw, he also said I'm wrong in handle Sean's Signed-of-by, still don't
> know how to do in next version. Should I just not send this patch?

Christian can you explain *on list* what is wrong with handling my
Signed-off-by? As far as I can see Ning has done the right thing.

Please keep the conversation on list so we're all in the loop.


Sean

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
