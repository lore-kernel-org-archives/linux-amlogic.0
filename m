Return-Path: <SRS0=7Y9l=HG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBF5C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Feb 2021 18:30:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17DC264F39
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Feb 2021 18:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17DC264F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c1755OSVX+Kn4O4wWEXVQOleQeI30ojpwEW7Nukj/IE=; b=aUAlIByFY8phortLWVX8cp09W
	gdGBPJsULxSqvPzd8z0h0hSnXFTBie3z+of8C8TStKYqCko4G5DCEFG0UNwe9mPyqrKzbpTewvxo9
	TnYOi+vxbWX243dqO2wrOcXl/E/yn3AbWpLUi1n0GMhoNy7BLHk15yId/ukIiImU343E8U4Cd3Pud
	cSO3NDEssaWBZWFYUjc4+HCJjY0IDbvq6PZfAflZc2Hc1Wl4p5a3hqU0AQd/tEIEUnYyHDhv+E9tZ
	lAL67ESl3MyA1bTH8UXvZXgiXP+v4DM/dJnZ4k06DMh+vKj+oItLTPnwMQKK/vO31hcXeK2yr/RID
	oO8dLQdxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7jO7-0001ww-M3; Thu, 04 Feb 2021 18:29:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7jO5-0001w3-DK; Thu, 04 Feb 2021 18:29:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13D1B64E06;
 Thu,  4 Feb 2021 18:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612463391;
 bh=m2ULECe/5nShjpaNukVPB1Kg9k0QQfSi+2ZmqBBEpGs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O/LNBdO3xd+g9w7/5qjfXOSTtr4mSJ9IrEz1BxVvwHFiiel3fILTMyxF534RzQQ6e
 dWNmW4YGkhvR3f0qNjS1F1cWrRBMnsLyW1vNcoqBVmXGn6etQ5nHpKlRcWNHvDfY3I
 18fpGaTjYYafIzHvYgkqDlZdUYjXqHZqYDYrE8B3KTAurSebytxHkx/+7SfOJmKxtv
 89V+vfbFUaYNvT3t1SVFjp//aaornWIug+AH20j3apiqMBiyXwAB76RYE8V6Ack1pN
 4KVJeJiu3hHE7/lDBCLzXRh7+wGLvZ/Xw32uIGZaMFElJNBnci1ddtEY22poxwjSte
 2KS29439QNy+g==
Date: Thu, 4 Feb 2021 19:29:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/13] doc: bindings: pci: designware-pcie.txt: convert
 it to yaml
Message-ID: <20210204192939.0daaec74@coco.lan>
In-Reply-To: <20210204172945.GA662023@robh.at.kernel.org>
References: <cover.1612271903.git.mchehab+huawei@kernel.org>
 <706e684f571e142362d7be74eb1dcee2c8558052.1612271903.git.mchehab+huawei@kernel.org>
 <1612287895.001149.3887347.nullmailer@robh.at.kernel.org>
 <20210203074900.6d581153@coco.lan>
 <20210204172945.GA662023@robh.at.kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_132953_610461_DC75C088 
X-CRM114-Status: GOOD (  27.50  )
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@axis.com,
 Kishon Vijay Abraham I <kishon@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Em Thu, 4 Feb 2021 11:29:45 -0600
Rob Herring <robh@kernel.org> escreveu:

> On Wed, Feb 03, 2021 at 07:49:00AM +0100, Mauro Carvalho Chehab wrote:
> > Hi Rob,
> > 
> > Em Tue, 02 Feb 2021 11:44:54 -0600
> > Rob Herring <robh@kernel.org> escreveu:
> >   
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: properties:snps,enable-cdm-check: 'oneOf' conditional failed, one must be fixed:
> > > 	'type' is a required property
> > > 	Additional properties are not allowed ('$ref' was unexpected)
> > > 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: properties:snps,enable-cdm-check: 'oneOf' conditional failed, one must be fixed:
> > > 		'enum' is a required property
> > > 		'const' is a required property
> > > 	'/schemas/types.yaml#definitions/flag' does not match 'types.yaml#/definitions/'  
> 
> You need a '/' between '#' and 'definitions'.

ah, OK. Will add it at the next version.
 
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: ignoring, error in schema: properties: snps,enable-cdm-check
> > > warning: no schema found in file: ./Documentation/devicetree/bindings/pci/snps,pcie.yaml
> > > 
> > > See https://patchwork.ozlabs.org/patch/1434686
> > > 
> > > This check can fail if there are any dependencies. The base for a patch
> > > series is generally the most recent rc1.
> > > 
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > > 
> > > pip3 install dtschema --upgrade
> > > 
> > > Please check and re-submit.  
> > 
> > I've no idea why the bot is hitting those. My tree is based on
> > staging-testing[1], as I need the regulator patches merged there.
> > Such tree is based on v5.11-rc5.
> > 
> > There, dt_binding_check doesn't get any warnings on this schema:
> > 
> > $ pip3 install dtschema --upgrade --user
> > Requirement already up-to-date: dtschema in /home/mchehab/.local/lib/python3.9/site-packages (2020.12)  
> 
> This particular check is in master, but not yet a release on pypi. I'll 
> be tagging a release soon.
> 
> I've got this problem that adding new meta-schema checks like this one 
> requires fixing up all the existing in tree schemas first. So I give 
> some amount of time before adding them to a tagged release. However, I 
> want to start testing new schemas right away. I haven't come up with a 
> better solution short of importing the meta-schema into the kernel tree 
> or separately versioning them.

IMO, having the meta-schema inside the Kernel tree would be better...

It took me some time to discover that some problems I had with a past
version of this patch series were due to something outside the
Kernel tree, at local/lib/python3.9/site-packages.

Thanks,
Mauro

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
