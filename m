Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D8ACA5FD4
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2026 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RP3TYX1uY2V4PxKate+2YEnjfXzDzkCBwU8djeWj71U=; b=QNzbGV1Odp3wYT
	UvXVcGvvSatGQXjm8jqWqo2qX5438t5m21ZhxH1t/yfLmOr2gM6486IbB9b9yWtQsBTu2/VShHy/i
	Y9t3xwGylxKjpWr4wj+FTu6nbK/go8LAPI/w9HaTKD+DxPVWlyq5kgKXQu5w7VXWPBneTak8OjwZu
	PoKcOUSs0VvSm9m8SlA4DAHaCZnB84o7d38QU01swWCqKLJm8tjRGgpGTrP6VuRn6bTdKjxxkroy9
	YFd72sjJ+I2svMFeX9DByLOwXupY29I0wWCoNIFr7w+eHAAKOnEt6kNw39fsnOSj+XKL876N8d1VN
	ZRzo6wS2umS1Cjv/uA/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZZ6-0000000B93k-1Ym7;
	Fri, 02 Oct 2026 09:28:28 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZZ4-0000000B91m-1TGd
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Oct 2026 09:28:27 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so40980415e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2026 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790933304; x=1791538104; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/xGjEmegI8pTO7Ox5jxESlFHhUmyOfP4GxHY3lbaDc=;
        b=vm0GYr5KV7cUN9BeiLDmaShrjgRvnc9A3aavmC7pKXEe37V/bSHcCLIUfQYGNE3DYs
         Jwwc9jOM5zkGh6gthtk7FpOlGnv7uY19Ul3NNuIJ3PXea7SZWycyRS6sN79PiBfseoEW
         jjsLIPtgyo1eqz/XeE4McHLNXryzPgE+qpAMjJlnW48xgJFR/KfxpgyQCKtu9jHfhe0X
         5L0YUcrSMrKN4euLNlk8hNW0S2HqHEuQWUSPa55YgLwTerOcrJDisSmVAT+5Z4dnXkKx
         mcvHliN/h2xl4/f7C6UNtBf2RZT4acrpah1Z6tEmbpHFxS5CXSjhNFeBUFzgzFjnKntL
         HH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933304; x=1791538104;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/xGjEmegI8pTO7Ox5jxESlFHhUmyOfP4GxHY3lbaDc=;
        b=nEIxQAipdA7fOBE0Nm8VBbfsOWPvPFea0CLfs/UC8VWw5Di7q/yjN+C7E3j1VDuTt4
         TsSefmOQPwO3j5xcwyafijn+HduTTMjZDMICMoGldLM++MdTzPNuA9VNNjOI4EzO/7Vh
         ZfqvXRUa42WawtURZ2G5N2mJ56v7SvTQpWoxzBOVOS238RgrW1VswL6p7vboA3edGYfQ
         MZHuBaywLnf39mc4mjukAoDcjd1Jthmbkh980qr3wCrmuf3TkpbzRRTTaVC2tmzrVAZI
         CbJTH69+jmOTS5bL8UHqBtV8hYVnlQzpdZ6ILJO0BZxPObrz0hAYafdx1g6LhkMcVwwO
         7y+w==
X-Forwarded-Encrypted: i=1; AKwUvBzsbEWo2gKJiIY6uWWo3qmzyzOdWsmXs3eXOKzr6NJbWyfg5F5AEIUyheLh7NGWYUWpQhXINzOe0yUV9FRR@lists.infradead.org
X-Gm-Message-State: AFuF++nR+Q9QeBG9HHqCqDCU0Tfq8e1WMpbLtFQ6n616dei4dKmx5l6Q
	RabnyoUVQJzLJMhkUB3abDDGY4bBiSv2zKguPSiJpLkTqR3r31EkFQUYAFZI/onZE6E=
X-Gm-Gg: AYBFou1UsAVSvgJN9CmjXLg+odRel666dJ1gycmMEt6+JXGl2RXQtYhnqLR85d96wvD
	7dWl0+0l7vahKroN/DKFMQE7oNlxynWFOt5/POqXkhHNeIdc6idpUbV0/D90sICNsBvxDdy7xBp
	YwEd6pFadliy5lYFQPTuuC7r4uqRLsws1Wr5z21lsL5rG24LtyVr8i6gpMr11+EdjXgT70rciL3
	ct+7pfUs2+q9QebZXxeKc8GU0bDeEukCK8c4G9ncHS69Y1P6qKz5kt0CN0pyWwp2w9OAFlsbuef
	ZqbD+DIgU1geqw7AMhKUiTHrLtfv0Ma72IKqP+RVYKQU3WcgtCknl9fMJ0R7s5DT0+PUMlyVULp
	j0684wqos03UQmdJqVhFtSUeuuf0lKjqODXZuADhejkgUjOHuzWOS0sR3AFeeUWqGsMITc5vs5B
	AWYaepcHGxYw2VGSTuZs7tNJFBRyHUDTejN8wm5Lgs0UiF8AnSRociitAclh14duSGPixrcgzUe
	I7k5D0eDCwQlJIh+zc=
X-Received: by 2002:a05:600c:840e:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-4a0276ea428mr38917245e9.27.1790933304386;
        Fri, 02 Oct 2026 02:28:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03950375dsm22989995e9.1.2026.10.02.02.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:28:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
Subject: Re: (subset) [PATCH v2 00/12] soc: amlogic: clk-measure: Add
 support for more SoCs
Message-Id: <179093330346.2296861.8852172233922608550.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:28:23 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_022826_413859_B2F4D4A2 
X-CRM114-Status: GOOD (  14.53  )
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

Hi,

On Sun, 20 Sep 2026 18:25:02 +0800, Chuan Liu wrote:
> This patch series adds clk-measure support for the Amlogic A5, A4, S7,
> S7D, S6 and A9 SoCs, listed in the order of their release.
> 
> The clock names for the clk-measure channels are kept consistent with
> those used by the clock driver as much as possible, making it easier to
> identify the relationship between the clk-measure channels and the
> corresponding clocks in the clock driver.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/drivers)

[01/12] dt-bindings: soc: amlogic: Reordering compatible of clk-measure
        https://git.kernel.org/amlogic/c/b6dd5a5465bb1c24279c1b18d9ee738c996f9ec6
[02/12] dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
        https://git.kernel.org/amlogic/c/668232197683898b1dbab05d6f1e7f93084160c1
[03/12] soc: amlogic: clk-measure: Support more measurement channels
        https://git.kernel.org/amlogic/c/abb63af22300c59e0e8dca322c21ed186ba7e51f
[04/12] soc: amlogic: clk-measure: Align compatible entries with DT bindings
        https://git.kernel.org/amlogic/c/8c6e2215b7ce72901e6aa2fecc4166d75e60c7e8
[05/12] soc: amlogic: clk-measure: Add support for more SoCs
        https://git.kernel.org/amlogic/c/5508eab53e4b79a1b45f78713cab6e7154131800
[06/12] soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
        https://git.kernel.org/amlogic/c/a848d72aab71e19ea78180f2502ad7d12818723f

These changes has been applied on the intermediate git tree [1].

The v7.4/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
