Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C2606A323
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 10:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ekIEZCPX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GNzdroPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nmqLGnD+BOsjoLbvKhevNklmMbFjiYOaAtZqf2C6bN8=; b=ekIEZCPXhWJ+o+th8hijbvPXIo
	H/vK8x2xsKop/fcnmjwE1F7Zz6cKazoEzJdCPG9WkHXesSsz+lWlJyt2GFaX6jcihgVhMYA6Ad4UP
	W4lOranzJku1bsxZEdwjltOFqgyW4lmG5sSXPaz/YIOhqFsyyN8GmNsMfY0WMGu7UczihLJKjQXny
	6crZ4gZ10FsJHZOROM23iNFtvpshnYixtLDx5ay9xkCLfkNyuUyU7g3hhP/aBhozfXB5adlcxPL53
	9DXIqfFUsC+a819WhHNtwmsbg2W9/SAijkb2+ukiY2t+WV2vXmhKcpmAlv7WmgNPkT7zjhCMERWSA
	Rmwy/4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWnn-0000000Ckue-0InU;
	Thu, 26 Nov 2026 10:34:07 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWnk-0000000Ckty-2gfY
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 10:34:05 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3282db206d3so2534274eec.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795689244; x=1796294044; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=GNzdroPsYfHRU1JXLTSwTuGObrhhYet3CCLV8GOOUv/jx+ScufxXjnv8VBoDnkiY6k
         6Qs/A/ezx5bpFyXvorYL8HVN8+odd9bYHYqPtlnjpyslnNZk1m3I8eAw8Gx8+Ah7BSwk
         RV+DNEIzo2jNt/gRNn2Y5wC518fqOpN/EdIrU9q2LNnzf9pReAWVrCW9fWHl8NF2Fhbx
         fCJkUqBi2dIM9gZIyPQ9SluLVVdLdp0o4atcfLOC8KkuWPxG4WoU9VSNHVE5i6XXWDUI
         l+0jUNnqRdOn4nb0dGnaEMG7B6LNS7YNnnnJK9dDK2zJkCCifmldMZrMXwWdgwOgZnO4
         djZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689244; x=1796294044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=MSAs1eiaIhmFTkKas3VJfEan3XKvwnbAQoZeBlQCSKUmmNh0VoM2X4KuTeTMgSmGwm
         wlg5OrPfTXSgPC5ZB8DgltC2FNvveLfIPZup8NSP6dO7Koh9px1p0aO9+QUwMSMgaORC
         847+/huhALM1z9I/Cj9TlFToxDkgoRh7q3A2HFIyS+Njaz9LctKNF4k4ZPbROXC+xvaa
         T+akgfL+SrtFLWqjpQeHLLAk06DDoN5WC8byFhe3KXZJbnsfyZ6jMrwfl7pFBjrnqcBC
         HRW1rhStkKBUZcvMNkqOZNoGjvwa/8j9LsIYxLEFOljTnLPfKY05hKbI6fnuSZm+MPfD
         kSjw==
X-Forwarded-Encrypted: i=1; AL+hErEuKkqC1w4H47rbqDGVAbidE51YZlgfksVKvG8KZnKbk2x0aSrssJMVt379IVBhBaT00AOBq6BG6dRDJZ0l@lists.infradead.org
X-Gm-Message-State: APuU4Z++D1FOExiO0BZUT9dJECoDmzgR9cRGNgzpQg37btteG/gqDa1Z
	KXK4Qx+O/FeswdofhrlIpnMVGMxogvQCNy+NVmjm0NBtS/uIrSoBZGSeijkQWIMDkAw=
X-Gm-Gg: AZFdTZc/CjjYti2aKEtwz8JlhYHMDPgO9hirJZSs9LzLX+y/4uXqAi7PRKRui6NVfsb
	OmriQ8zCF42eCS0Q+D3R3S05oPLcsAKqWmTvEpiOjMm8EZHGv4oWoGHAtHVntO1ClatWzNbrNB4
	9BAlBMMnkQLJXgdsXFKPflf0spftV86R9A/qn+BFNOQwshmV036d7i7zxwuTe6y74004F4bqHJC
	VvDpogMyK4ZqLzfIuJ2cARfJLgf944qJ8GR9eAU+civSdTQMAZVGXEGnxkGkP0lyEDBag2jKVga
	T6l1rFOxsAndA03GN/vOYaXAjPzXxv//EefZbDxTJqPkacohsv250jdlfpB+7A1nAu2vt+OmDfr
	2iSBySwegHVuk6S7XtN76AaVoZQybI1LLRMloD1JoH1JVwCs1AArDHsiHtCVqx3puyVo9gtJc6y
	wvM8QjFVuJqSZhjpMRy+wLeAPptLW/hZHjeYnB0PNI8I+c6ENB08Kkwx4xWn9WJNXSblUsUWUIB
	HAbbKz1OZ15XWvX8zgi8hZweAPLnX/yA3mqMw86KAAj08wjimtVjeRiCAVrfV4tWujo0ondF585
	ePVvr96Cy9BuMtk+rojcP7ZWfhke8w==
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr4653486eec.13.1795689243454;
        Thu, 26 Nov 2026 02:34:03 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm76487652eec.11.2026.11.26.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:34:02 -0800 (PST)
Date: Thu, 26 Nov 2026 16:04:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <awgLGFpH73_fcnbC@vireshk-B250M-D3H>
References: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
 <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
 <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_023404_701298_68B54CDB 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>, neil.armstrong@linaro.org, conor+dt@kernel.org, christian.koever-draxl@student.uibk.ac.at, rafael@kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, bmasney+clk@redhat.com, robh@kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-26, 17:49, Chuan Liu wrote:
> Yes, as shown in this patch [1], I forced the above two
> "assert_single_clk()" to "assert_clk_index()" and it worked.

Maybe this is the right thing to do:

Functions using assert_single_clk(fixed-index-0), can be converted to
assert_clk_index(fixed-index-0). Lets make this change in the OPP core (in a
separate patch).

-- 
viresh

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
