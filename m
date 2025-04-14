Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA697C369B5
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Apr 2025 12:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8zpyCXcFwdRBYjZOI00Dk0pP6MhmfVPmX/T2MDhwI0=; b=ucb489ocLbSc7c
	rIUGZ8GucqsFcMp2Ye+jLQWe9e2SvZTfipNweUC3eL+YOQ0V6DyMHH5g7A4lNUyNcv3W5zg4LRCCV
	p9+Qbve6JizcpREKkSOc5CUD5Q70xPlDn9l/4Bf956+SGSEMgZPPCSQ77Y5g7WZ1vhF3pDDRaYjI3
	b34wogPZelF0dfG0jy63IyMvELPjW5WQCJIhEI5i0yP66r/gLttkCkA1a6ytAmr0PSVAcxiW+fybR
	U6WmVFTGPpPDkbqLMb+oIAISNBMZNh2eqa7pySkta2Met956LEjScKbK5ab5fO45b646iUbP9roIi
	7OpqoVhjJNYKJM1IHCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J2o-00000001xk7-01zC;
	Mon, 14 Apr 2025 12:36:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J0X-00000001xRa-2OMq;
	Mon, 14 Apr 2025 12:33:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E60FA45117;
	Mon, 14 Apr 2025 12:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C29C4CEE2;
	Mon, 14 Apr 2025 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744634028;
	bh=t1toO7w3jtiuM0z/5E1BAN7M3f4Zd+MamGderKQMHzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EqAOEOU5Ih2l7qouIuhnxB9hV7Y69NDFwpQEF6kwT7giPfHPw7SGHoFF7xOZOYB2n
	 +eKi9YsDDnp1BaKR4FYNiGkITE+WfTM4ThI0NqaNQJsftC1y8vYnkKfFbcZQJ0CO5o
	 uMqA+g69thaaR7ReCAF/FO1cQ6ZkehQxhPHm9iukWSMX6tdx0S26dqdA+I6uvAlLBF
	 WDaiPY7luZ2XkkFxhtA49ma6RoiNLzT+xBuL5W//4SapxL2tuo7qwIeEU4v5oUa5CU
	 7WcMd9SQvxpDu/sTZSbQcFcT8svQm+fI/SnAHROhfnF1sGtXeBbB6JBYcz0eZD++Dd
	 LZY/naVHEnqjg==
Date: Mon, 14 Apr 2025 07:33:46 -0500
From: Rob Herring <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
Message-ID: <20250414123346.GA135245-robh@kernel.org>
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-2-65077690053a@amlogic.com>
 <174463269823.14040.7362554560667126238.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174463269823.14040.7362554560667126238.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_053349_629846_204290C0 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, Apr 14, 2025 at 07:11:38AM -0500, Rob Herring (Arm) wrote:
> 
> On Mon, 14 Apr 2025 18:12:29 +0800, Chuan Liu wrote:
> > C3 adds support for clk-measure.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> > ---
> >  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml: maintainers:0: 'Frank Li' does not match '@'
> 	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> 
> doc reference errors (make refcheckdocs):
> Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
> Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
> Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
> Documentation/arch/powerpc/cxl.rst: Documentation/ABI/testing/sysfs-class-cxl
> MAINTAINERS: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
> lib/Kconfig.debug: Documentation/dev-tools/fault-injection/fault-injection.rst


This report can be ignored.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
