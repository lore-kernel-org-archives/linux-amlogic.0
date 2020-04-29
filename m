Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459F7C83006
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 18:46:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FABA2064C
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 18:46:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mwmsWEht";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="v8RjEYW2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FABA2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lidD8j5zSLBdHrONC/0bORwU/UXzVvg2flHZZkH0zIE=; b=mwmsWEhtRqnhwE
	pWCoFsIBWA1VI5x4S24Ve2p08nNfyOVP+fu+pIbfb1YXIWlFkmX3LjpDqdy03Jgs3acgHK5c2DOZh
	+PExP8k+IjPNi9YOhRgK1JZhGBm2hspcoCStsze6BoE9N26qFXZNf5PbxaSKCcHelZ5UVMbFIhpF1
	h0nJ3fDvCtzs0rQIB36jp33aemIyKIiqozwofdU4syH6gcs6m1cWIj1NOj3s1PGuU+mwJwAJ+mpVg
	QWcV7CYNIy7QCwQnzuIRianrJTHwoy6Yfz7Au4zz2d+kao0CtBmCPUjGGRhtE5kWYr63j0dLiSPl+
	CpNbFb94KCzDxUcHSrjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTrjI-000584-8C; Wed, 29 Apr 2020 18:46:44 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTrjE-00056x-LI
 for linux-amlogic@lists.infradead.org; Wed, 29 Apr 2020 18:46:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id u127so3193000wmg.1
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2020 11:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=V3qZVHwLaLK/I0b0rJ63jIE3SQ22bSXyi7PMzS7GVwc=;
 b=v8RjEYW2XwlnNxy17CGhj1lG7soRDm2FdRbHVvt07M7BPpiZupWPv5xqJsnSj6KoLA
 dT9Cr8hP8fI35N+Q14QOEu6k1jbn4fMl82QE+K0xgmvNVRMoVc8292y7H8ByWjjFSE7a
 PdbGY8EE7mNL29zhFBZ0bITzNJ1JSUCby2sDsYTwnaIlxN/lwf6pZgwsQvgo1zIP9RQv
 Qq2Fh/ztGRrUxpFSqjhVDt/ey9aa8li4ufifTG+lN0dB9PU2hxbGUHi2k9DZnUBRoCFI
 iEp12Az23yfAo4hTW1jDEaXzPTQYHVa6JTT+GTErAiK+w+i5TMEjybytvo6Bzyp1jSBX
 zOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=V3qZVHwLaLK/I0b0rJ63jIE3SQ22bSXyi7PMzS7GVwc=;
 b=DAN9Oj7Ys+Opt5oi16NILfmSZeNdbYY67mAD4hGREyqDrjYMlkvUlxlKoBL1RksV0E
 hLqhlK1/t2uD+b9Fpoopcbty+aGDfjik5GJCgmYFje3e//fnI0wyPKNZEmObUFr9JsB5
 nULPUAQ8ewZ7ENUlsIDrmftp3m54OhBOLs5kcFn5XCo7xK9PdaA/8O+20sJxJNGQX+oc
 SSK5+mx/mvZLWdvl4gc4JJDxhzZZJqYm+j0S0mAIXn+UuTgzsAJ92aqkLhg9UBo7Qffz
 rAMiQOPNGO3KA3uvYJV0s9BC0eqgDLadD5lKVg0btDUm6w33dWN4wbBK/2OXa3ukYi/b
 2bpA==
X-Gm-Message-State: AGi0PubJd58syBmi2EnCb2e1LXZizj03AYU6F5gPRNNqgazczGgg2ov3
 kE3mzFY0GLjL7tyBtiZVLzRXhw==
X-Google-Smtp-Source: APiQypJdmpXOVXDmvkIQZMAsdMpd1NkWe/42oxJwKXczVw0SkYct2NGkjK3LGFf2yreraYRKmtXSIw==
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr4774219wma.138.1588185998986; 
 Wed, 29 Apr 2020 11:46:38 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o6sm145378wrw.63.2020.04.29.11.46.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 11:46:38 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson-g12b-khadas-vim3: fix missing frddr_a
 node
In-Reply-To: <AA7AFC1F-AB6E-438D-8510-BC472552C554@gmail.com>
References: <20200415095927.3780-1-christianshewitt@gmail.com>
 <AA7AFC1F-AB6E-438D-8510-BC472552C554@gmail.com>
Date: Wed, 29 Apr 2020 11:46:35 -0700
Message-ID: <7hftcmku44.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_114640_696723_BF39EED3 
X-CRM114-Status: GOOD (  11.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

>> On 15 Apr 2020, at 1:59 pm, chewitt <christianshewitt@gmail.com> wrote:
>> 
>> From: Christian Hewitt <christianshewitt@gmail.com>
>> 
>> The frddr_a node was accidently deleted when creating a common dtsi for the
>> Khadas VIM3/VIM3L boards, preventing audio from working on the VIM3.
>> 
>> Fixes: 4f26cc1c96c9 ("arm64: dts: khadas-vim3: move common nodes into meson-khadas-vim3.dtsi")
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>> arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi | 4 ++++
>> 1 file changed, 4 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
>> index c33e85fbdaba..c6c8caed8327 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
>> @@ -154,6 +154,10 @@
>> 	clock-latency = <50000>;
>> };
>> 
>> +&frddr_a {
>> +	status = "okay";
>> +};
>> +
>> &frddr_b {
>> 	status = "okay";
>> };
>> -- 
>> 2.17.1
>
> NB: I appears the same change was sent by Neil in [1] as a fix to 5.4, but
> this appears to have been dropped/missed somewhere.
>
> [1] https://patchwork.kernel.org/patch/11198535/

Hmm, not sure how I dropped that one.  I applied (again) the original
from Neil (with updated tags from Jerome) and queued as fix for v5.7-rc.

Sorry,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
