Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DEAC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 21:07:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE082065F
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 21:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S9Kerk5A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DE082065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9YqQOrXnsfO34k2K03FDdi4RgaJyI6sFt5qcFjqWSkQ=; b=S9Kerk5AzNXj11NHyGUxul8LI
	KMfvbvHrhIIvsa3lK90P7N2ouaU8UOnrQPNmodyKgA8wROyBNk2pjrJonin4KPB6ZE7nVDquqcTIQ
	FszJtwmUXVQD18voS0TK4OkZ9OkAX75k6pH756cQwboCnHGTtvd9L45M0RKb9WID16UICAHVU0Tqd
	Fw0y46CBscj3aDRYj1QiflZue5ZmilQh2oqGNUJS7IAf57pDaPKymAuEnfPzegMbNssHGQOscvS4d
	Yjw0YRfLFbCxFDQ/LuuaeYSu6Y9h21xZIlyF3wPxF+onkgRgDUYlafqfDSOt+Hk/HWhDp9kzXII/U
	5ByvDOQkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyiRC-0001Vj-Em; Thu, 23 Jul 2020 21:07:34 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyiR8-0001Us-7a; Thu, 23 Jul 2020 21:07:30 +0000
Received: by mail-io1-f65.google.com with SMTP id l1so7733718ioh.5;
 Thu, 23 Jul 2020 14:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DqiJg+iVm+KO76sfvCQ1PcB5FB3q5avv7am6yCHETiw=;
 b=GrJ+hiyiDZCkLdtWGkRi0tj2w8pNAPJqJtTTQYacH7Iptty/dNJESWvum+D6KM7SIB
 TAoicUdC/z3u1+XSB0Hq/L3j+k+ief3IAZKeSqPRDGEs85O+eIBK+UHPT3cBkUJMsvwx
 jzYjqAPMT+k9vGAX/P1eWS+VT2pxzQus6H2mA20VO8I/siWVsvsTKA8BPXOdmF1ndeVU
 +TR1hABYJsTXHwAZg5NQ4fGdMa4Wi7zex+dGUvwP6iJGe9J9VUZIfL/iS7CGT41DhQ6B
 Lc74G3jvkRbVP9Yv2Ju/eVAbUUVUT49grIyQ8s2Jd24kSuzoGJoWESWAyoRE+nC3msC0
 63Cw==
X-Gm-Message-State: AOAM530QscNngwnPvuNHgXXcUT5pxEDEz18c3g8c/i9NNoVTLD5aCUOm
 Bl5i5DJ7qfq24oohw8zdaA==
X-Google-Smtp-Source: ABdhPJw41flIcVg/c3woDitOvrf2Wnz/THl1yI2iKhN3PaLn3hSvaeMmDaHtlOtXhqqQjr/qpfOk1Q==
X-Received: by 2002:a5d:97d1:: with SMTP id k17mr6942837ios.100.1595538449560; 
 Thu, 23 Jul 2020 14:07:29 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id g1sm2001627ilk.51.2020.07.23.14.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 14:07:28 -0700 (PDT)
Received: (nullmailer pid 860277 invoked by uid 1000);
 Thu, 23 Jul 2020 21:07:26 -0000
Date: Thu, 23 Jul 2020 15:07:26 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the
 Beelink GS-King-X
Message-ID: <20200723210726.GA860231@bogus>
References: <20200718052258.2890-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718052258.2890-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_170730_325506_92194D9C 
X-CRM114-Status: UNSURE (   9.43  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 18 Jul 2020 05:22:57 +0000, Christian Hewitt wrote:
> The Shenzen AZW (Beelink) GS-King-X is based on the Amlogic W400 reference
> board with an S922X-H chip.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
