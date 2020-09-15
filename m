Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C076C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:43:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02025206DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 19:43:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FfwEVpcc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="J2hKvjCg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02025206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L90sDV4xtYwgd2fKNXfW+vlcsDoyP9Y7UxQQhgmw5pw=; b=FfwEVpccUD00ejjbBXS8iQHPI
	XXynJ8vrowsm3JjiM7Stj2Hpwi0zPhyOD/+nyXPnQiAmKILWdvmJ1dN/eTxtomZ54/egFRGUtUh4f
	MP3+swRhnxzO8YWg6knGDe3IhoMjllXKqDmRzu0+3HSeKLaUi2XgpZvkziQL8zdG1QjFhW+rIvzO1
	SKvGEjbHVqMrvVMNXM133AID79h1O167hzIpj6v+epAk5PBo0oNSqdvmUjo4pHELkVpcJ56wH3hJd
	Vm3fnCvD6njyxhjrcZoT1jeSWJdmNRT7dSO4mbNmowRpbibLFl5M8t6tn+n3bLooH2BwjpciLtQMP
	u3c4Ty/2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIGrW-000316-JY; Tue, 15 Sep 2020 19:43:34 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIGrS-0002zU-E8; Tue, 15 Sep 2020 19:43:32 +0000
Received: by mail-ed1-x541.google.com with SMTP id w1so4247284edr.3;
 Tue, 15 Sep 2020 12:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wcSO66tZ1+449n/ove9k/zl/ZApYu1cOtIa7l/SoDz4=;
 b=J2hKvjCgngd5ccVeeKAhzqduSNgyZjcUl4Z9d+mXzTCN4siCjHc6qQgQFmuhJiZE1B
 LbICe2Bc8o7RJNMKKwBmcNLjTMbFz2XTyK+ZRmeOz2Rt1rMA6Hw6iMqFbXqbhn6RCmig
 6gi8M1Y2n0PQ9kE9WgCXl3Ohq6ai1dXRupaw33L07F2D+BNA9thfaK1RNU+7GVSZDW/U
 qf8P60DBli6UxYR53+O7EjEuEdY+ubNAXoUlok7uQWEK5ALOiU1OchBpG6pmunsEKzzw
 7cF4VXegLKExCx1yYGk+wzAslxFuGxT8uX6e+3lvRqxohdWYJqPgEfDJDo6acs0e0ch9
 tjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wcSO66tZ1+449n/ove9k/zl/ZApYu1cOtIa7l/SoDz4=;
 b=BnQUEvwZa1z53nYk59GY36aVD1xEO1++ikjQw9B+rBlq9PDTY6grScvI8diRfImTM3
 RyOMxBGxvRXqRbgrmIdXVXbnYQBhzejX5D8wGPChn1/UZAsec2q6Vow6TKR97LWOV4zm
 7jtaBn4QyyOQo0xnpX2n3WbIu7awpTMd+VvJlxpLVzKMlkRD9DOl0UXgsZGKwQN3sI+l
 +X1V1JzEYmvOjVePuLVjIdtQE9teKFG+dvtWPX88/k60TXCImWdsVBx7OwNZ0zgqAdzZ
 iAsxQUP5PiFfxEY8GqO+4Ohq4Gb+2MYOOCeN3TgHxX87VqU3zX8azmS052v/Ryklgs8F
 1vBQ==
X-Gm-Message-State: AOAM532XY6CneCDX4us1JwPBK0/BPc4UmcfUi8KlmixkvdpfyoY5p8cZ
 9JfF3Qlrm786oWwlMHh37PRgM14nR4tX0T6yzNM=
X-Google-Smtp-Source: ABdhPJxrRIfLMWTyAPVPBm1cJsmzAyW4ujVnPid9dKUNUoxBOMKBx1oz+uRocPLFv5HVc3Ukz/w/DdLDfKDIfquMcEw=
X-Received: by 2002:a05:6402:ca7:: with SMTP id
 cn7mr23632046edb.143.1600199009281; 
 Tue, 15 Sep 2020 12:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200904161654.24141-1-narmstrong@baylibre.com>
 <20200904161654.24141-2-narmstrong@baylibre.com>
In-Reply-To: <20200904161654.24141-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Sep 2020 21:43:18 +0200
Message-ID: <CAFBinCC4gy5zksKPrs4t0yu3U+4rFGy90BHRduQ4wyUOv2x_Nw@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] dt-bindings: power: amlogic, meson-ee-pwrc:
 add Amlogic AXG power controller bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_154330_546543_0EABCACE 
X-CRM114-Status: UNSURE (   8.23  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Sep 4, 2020 at 6:17 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds the bindings of the Power Controller found in the Amlogic AXG SoCs.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
