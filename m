Return-Path: <SRS0=xbMy=4G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D468C34031
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Feb 2020 21:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EFB62070B
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Feb 2020 21:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rJHLh6u/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EFB62070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IS74egMYCpHUarEnpaXeEOnjLbAau8LmoR1iuCDK8oM=; b=rJHLh6u/Tfp3zt
	HkJs3OOJjxqKp3LAM+D+W3ijIwhbX6ffKYajeqIVwVeH1Tr226q4CsL0ak32VYZBfgr2UR4e+k3Wb
	gyqP361l8u/sksqvF7cLLkerdNKzAI6zNelW3JHi6S1uUjsrhlO4Z+6+xl6eDRtCBQR71gsVMKMPU
	ZvpGeeuRztI/KHusEeALlPjOhA7D2L4FsZ/vnZM3x42IB5nWI2x+9SPJtAmCKSDA+yBTGCDFjatCY
	xzl2AyKwGcGp/zyLGzDPjr2+MdOD31lwUsBNw40JITlfJg+HMEbu1aEE8yMT4j9zP1utlkGx8A3br
	tSFUBQdZZK0pu0UjDL5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4A2R-0007m2-RL; Tue, 18 Feb 2020 21:04:15 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4A2P-0007lN-HK
 for linux-amlogic@lists.infradead.org; Tue, 18 Feb 2020 21:04:14 +0000
Received: by mail-oi1-f193.google.com with SMTP id i1so21557881oie.8
 for <linux-amlogic@lists.infradead.org>; Tue, 18 Feb 2020 13:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UwjjYnG/jWqlCLFoFu94p360e88borBKuEW+C88Dv3s=;
 b=duPLD9Rb7X+91PtMm02t0v8yAvggjCqzZFbLGhL07Vlr4vOouQuw/qooc7xFX0rRPV
 3ofnMkurKUdzuoH9Yo0RovUoeJLC68JIO9aAaAHK7H6L7n+TfMmC+0ebtZ3Kq+JbcFhG
 2L7+1oglmfU6Md96NypKi/4JiLOc0d5VMGUraUhHbuPGPih9lOjpKhwdglKHi1mYrt5D
 AbjpQW53/F0v17jYN7sNR30tmPRvvUNeZLJIMGLF9NjlTdCokmZlmLb4TMCm3GL8IWPH
 h/q/tlQDdxCUMphXwVmNnmlYxuoN7OvYSvlW8E4Zmpy7va/yMqYFZUefgnCcF0iyykF8
 UvRA==
X-Gm-Message-State: APjAAAVDgKacUXNfMa1tT7+JTcQ6cYg6yb0tvew0Cl6rhWKv+hsisuvc
 eMkeus3h6awUpa17KvEGgA==
X-Google-Smtp-Source: APXvYqwHJDNZjVGmm+GSa20E6MAlz3y9ic6qbHKnImkXJJw2j5CVcKD+jcgP7v4fZRSddspoiFrHBw==
X-Received: by 2002:aca:b808:: with SMTP id i8mr2457073oif.66.1582059847979;
 Tue, 18 Feb 2020 13:04:07 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b9sm1723745otf.56.2020.02.18.13.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 13:04:07 -0800 (PST)
Received: (nullmailer pid 974 invoked by uid 1000);
 Tue, 18 Feb 2020 21:04:06 -0000
Date: Tue, 18 Feb 2020 15:04:06 -0600
From: Rob Herring <robh@kernel.org>
To: Mohammad Rasim <mohammad.rasim96@gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: media: add new kii pro key map
Message-ID: <20200218210406.GA917@bogus>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
 <20200214085802.28742-3-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214085802.28742-3-mohammad.rasim96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_130413_575974_EA7781C3 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: devicetree@vger.kernel.org, Sean Young <sean@mess.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Mohammad Rasim <mohammad.rasim96@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 14 Feb 2020 11:58:01 +0300, Mohammad Rasim wrote:
> Add new entry for rc-videostrong-kii-pro in linux,rc-map-name
> 
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
