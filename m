Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D97C77B73
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jb81arlb0wI2/+Vfh4CyWiVd0VySNePdSeIsvSB99LQ=; b=gfl2SAFJxWqCXB
	dDFK7l6e+Tr+wGfXxgB1CDT6NXItoqzQ3eC+6KJbVaY4yKo9cW9bfKL4emZpNUc95Og+Y+eKbML79
	c/oq/ke4HokXx60sARwGcvIVcSt4Hamxm7Jp9S/U5/CPhYsb0sls/tG3DKNk79/089M90nuyjICbZ
	i5TOm4X350NycdgL1z3J0XCL0r/Fm2Ynra5JQxp0PeS7/JaDDeGtE2e2nnpn/iawveNGjgZ4ZA/IH
	EPOhGMXok4A6megg8dp6qmuJlrU8pqnwMKZ5HipfzRKdGgAkiHg2vZLrquLUiQCGX9OlyrmI0ep54
	GVCVUW8T+q08lB5v8TEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSyt-00G26V-1l;
	Mon, 01 May 2023 12:50:15 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptSyp-00G24w-1i;
	Mon, 01 May 2023 12:50:12 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-94f1d0d2e03so426357366b.0;
        Mon, 01 May 2023 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682945408; x=1685537408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dABiBso+HJ8wbQPnpMB1lKn8XcVP8XIEpgDNlp7gUc=;
        b=rnfgZH1FpvexC1G5XeLqKbBeMTF/Rjf4/BqneDMfwGyKvxd0Nl7sTkZ45a6HT4HZXH
         U/f+4gWb1XXZ+IE+0Zml02ZN9Gkym/5joLaVE7pkLyL2rc9aLn1rzuJ5itIHq+XAZ5L2
         jX1zRse9ArnwXheUwM4UkICWLvGqcKqd/zDCQ1ol0jy31U9IMAm7Do0RxUg5/bBnGAOJ
         tCp79hYvWdmmDm3KBtpJgSwip3kbp9mSpciADlqBymev59SSlh7Toz7lRgY0W59relNk
         SyXzyKoz/1GQ31nGzgtdqmGurXwKPS264NQdCRkuMJKgUrkrx8wSwoZ6tYtJrDa+TOR5
         hDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945408; x=1685537408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dABiBso+HJ8wbQPnpMB1lKn8XcVP8XIEpgDNlp7gUc=;
        b=bXUFlBjz0bg22KokfWbDVK/cspjaUnhcg0tDyUKnSo9eoiipngS5ajjOhzMqr6nbiK
         J5neR3ApuwqemZAMtI393j3aHUcb44rFdTPXStGTl09M67MCjl0DxNSAG5LJfcF/BLIu
         wmVv0rVWXYataHm/Fh6Tt7iwoL8DP+5DbZLcs0jSW8PJeB/zcmcWGk4n68awYAKOXuzd
         m46N+WfqHZKzwUP03PCnTVCIFXEQ4/phjhar8AmSu6Fwjre5DCUxOBi47M1HDExzQEpB
         HhsKBUX7sd0lXn+UdQeYjLJTKnub7AvOrd5WE9qyE10AyKG2qXEGqpvkUgH0slrdnSNU
         042A==
X-Gm-Message-State: AC+VfDyjORlzDFCTQfPhBGIkG/6xjGOSttt4PHDMPWjkIsOEiJMWyL1Q
	aSa8wQHTy9dVydLfmiB05uG6DF//5ssM0bMEnhw=
X-Google-Smtp-Source: ACHHUZ6kh11W0vvs/KuiRs93O7irLs7t1SO5gjsf+KvsgFcR+jdEXoXqUkKdz4U5edwWwHpfJ5sXtMLeYlbB8v+cOOo=
X-Received: by 2002:a17:907:3d9e:b0:94a:44bc:31e7 with SMTP id
 he30-20020a1709073d9e00b0094a44bc31e7mr12596705ejc.60.1682945408003; Mon, 01
 May 2023 05:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230426102922.19705-1-ddrokosov@sberdevices.ru> <20230426102922.19705-6-ddrokosov@sberdevices.ru>
In-Reply-To: <20230426102922.19705-6-ddrokosov@sberdevices.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 May 2023 14:49:57 +0200
Message-ID: <CAFBinCBLgKG2CL66z2+qF2mn--xLw75QkcNigwme4D2jmLBFuA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: meson: a1: support USB controller in
 OTG mode
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, mturquette@baylibre.com, 
	vkoul@kernel.org, kishon@kernel.org, hminas@synopsys.com, 
	Thinh.Nguyen@synopsys.com, yue.wang@amlogic.com, hanjie.lin@amlogic.com, 
	kernel@sberdevices.ru, rockosov@gmail.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-phy@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_055011_573040_53E0BE25 
X-CRM114-Status: UNSURE (   7.18  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMjYsIDIwMjMgYXQgMTI6MjnigK9QTSBEbWl0cnkgUm9rb3Nvdgo8ZGRyb2tv
c292QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPgo+IEFtbG9naWMgQTEgU29DIGZhbWlseSBoYXMg
VVNCMi4wIGNvbnRyb2xsZXIgYmFzZWQgb24gZHdjMiBhbmQgZHdjMwo+IGhlYWRzLiBJdCBzdXBw
b3J0cyBvdGcvaG9zdC9wZXJpcGhlcmFsIG1vZGVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXVlIFdh
bmcgPHl1ZS53YW5nQGFtbG9naWMuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhhbmppZSBMaW4gPGhh
bmppZS5saW5AYW1sb2dpYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFJva29zb3YgPGRk
cm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wg
PG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
