Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5848C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Oct 2021 08:50:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE4AE61A8F
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Oct 2021 08:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE4AE61A8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RmWWC7M+PEKYeMUt2LMacRRox2xvJaNxoYdccHN74pc=; b=QS81BIQ+WCXeKAtBDsd8DFMOX2
	HFBO2klLNgtSy3iSxbAri8FAH+JoRzDbqKLbOVestyVMv7WFBE6ywSYjW5KSI9fXHd+W1HIb7R9Nq
	UUXrGl3VdM5pvaSJHTvq69tQiPT+iCN2/UzEwp/hNw0Ttn8Jg/OPLFq9mzd1O/Wj9yNQWAle8zvwV
	uIAP7Cmy93NHk+5UXC1v+oLDoI6SXNpHfNCU9s/KNBOtBPolBj/QVK48SWJb24kGEctfaXmyQ/VIr
	XIEWx8kBP4MF8k82gqLD2Sas+E+62i96MpGXR00tWz1S4kFSyn77FN8U9xcYdHvZV8ggeaibKS5bD
	RYY7XsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWaiP-001x5m-Eq; Sat, 02 Oct 2021 08:49:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWaiM-001x4u-Cx
 for linux-amlogic@lists.infradead.org; Sat, 02 Oct 2021 08:49:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j27so8912476wms.0
 for <linux-amlogic@lists.infradead.org>; Sat, 02 Oct 2021 01:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yFRT4ycD1/iuPZQBIkdKH1q583n9EzNgCjIpEz/JY6M=;
 b=5rWTteAP1iZD9GjOAoPtb8knTiSO7drhYLP8c3VYsV9xx8n8L9DsVMi6e5ibAGdEXk
 bfWOmcURDBff+MqghPj+ILA4xKTbglDKF3Ir3/7Un5J1+0tRdWlyX4uxMGRlPA0cum4i
 uCjxhiMX+x0xyplfKPPkdLjaWkF+lv78PgcFKYIRQvFbGzUIKy90vku9SE/5fLdPfdZm
 LxrMUjhmPTdyn6cdHGMYwMoA8rcbVLlHgpHjAelwqYBa60bK1J6Xuy253V0jOMQWbjR3
 93lioeN3uu1YDWO/xXje/5XxC8WqOvEm6gRkpXslutyqHat9L0ul6iNB8LTyUvjB39Ol
 14hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yFRT4ycD1/iuPZQBIkdKH1q583n9EzNgCjIpEz/JY6M=;
 b=DoYlDSJaqdYRT2kVDT8qZeEQR2YiNg7lVJO/VLwnACr8mn2F1KaDGZvjp8VWgZBgZJ
 TEJ95zkfYlYLgenGJtTSL39t5F51jIQs8PGWogrv6Tvy3RFMK/gmnpPsV9zN/3/Y0esM
 Q35GlDEhaPRigCwnyFt/w5fAjqPlbzqXa/ofKJqE3+RxJa3m0f2MHzMMyaF1Videx5GM
 iJX/JUiD9i+fj68V2Tnkp0RGi+0l/2g7hTOBMWwsE30nxFmZIlnT7qisPjZL9lbSTHYA
 E2auqvgeaoQiH5hYDSWLBHkmZiZHujQmcaom1shKOI5ZiApUlt+IH5/AAvEXNWw/UZpf
 mIsw==
X-Gm-Message-State: AOAM533TC7p0/XaxPHP+vXz4Kj9/+hPSvrJnlmiUDoRMUImI08631t+/
 xNkZOwEPx+8xkzmeBEBY8a4egg==
X-Google-Smtp-Source: ABdhPJzehP87CcUEup6emq0hl0cr1sSYsx4/3l3wLAysw8zDqAdyZYv8F7eix5Quc/y4XVncjs5xtQ==
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr8735442wme.59.1633164588133; 
 Sat, 02 Oct 2021 01:49:48 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:edf3:4c2e:bd36:3abe?
 ([2001:861:44c0:66c0:edf3:4c2e:bd36:3abe])
 by smtp.gmail.com with ESMTPSA id m4sm8926453wrx.81.2021.10.02.01.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 01:49:47 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] arm64: dts: amlogic: Assign a fixed index to mmc
 devices
To: Alexander Stein <alexander.stein@mailbox.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
 <2921197.CJbAp5Dgou@natsu> <7him6135iw.fsf@baylibre.com>
 <3603832.OnnjH37t2F@natsu>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <e115009e-d93e-4e05-0ff0-c754fd867ae0@baylibre.com>
Date: Sat, 2 Oct 2021 10:49:46 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3603832.OnnjH37t2F@natsu>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_014950_524192_FE084083 
X-CRM114-Status: GOOD (  12.63  )
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

SGkgQWxleGFuZGVyLAoKTGUgMDIvMTAvMjAyMSDDoCAwODo1NiwgQWxleGFuZGVyIFN0ZWluIGEg
w6ljcml0wqA6Cj4gSGVsbG8gS2V2aW4sCj4gCj4gQW0gTW9udGFnLCA4LiBNw6RyeiAyMDIxLCAx
ODo0MzozNSBDRVNUIHNjaHJpZWIgS2V2aW4gSGlsbWFuOgo+PiBbLi4uXQo+PiBTb3JyeSBmb3Ig
dGhlIGRlbGF5Lgo+Pgo+PiBJIHNvbWVob3cgbWlzc2VkIHRoaXMgdjMgYXQgdGhlIGVuZCBvZiB0
aGUgdjUuMTIgY3ljbGUsIGJ1dCBJJ3ZlIHF1ZXVlZAo+PiBpdCB1cCBmb3IgdjUuMTMgbm93IHNv
IGl0IHNob3VsZCBnZXQgYnJvYWRlciB0ZXN0aW5nIGluIGxpbnV4LW5leHQgbm93Lgo+IAo+IFdh
cyB0aGlzIHBhdGNoIFsxXSBtaXNzZWQgYWdhaW4gYnkgbWlzdGFrZT8gSSBjYW4ndCBmaW5kIGl0
IGluIGxpbnV4LW5leHQgb3IgCj4gYW55d2hlcmUgZWxzZS4gWzJdIGFsc28gc2hvd3MgdGhhdCB0
aGlzIGNvbW1pdCBpcyBub3QgcmVmZXJlbmNlZCBmcm9tIGFueSAKPiBicmFuY2guCgpMb29rIGF0
IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibGFtZS81M2Q1ZmM4OWQ2NmE3Nzg1
NzcyOTUwMjBkYzU3YmIzY2NlYzg0MzU0L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNv
bi1nMTItY29tbW9uLmR0c2kjTDIxCgpUaGUgY29tbWl0IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2
YWxkcy9saW51eC9jb21taXQvYWI1NDdjNGZiMzlmZTE0NWIzOWUzMDEzNjMzMjU4YTVmZjQ3NWQ4
OCBpcyB1cHN0cmVhbSBzaW5jZSB2NS4xMy1yYzEKCk5laWwKCj4gCj4gQmVzdCByZWdhcmRzLAo+
IEFsZXhhbmRlcgo+IAo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtYW1sb2dpYy9wYXRjaC8KPiAyMDIxMDIwMzE5MjgyNC44NTQ0OTEtMS1hbGV4YW5kZXIu
c3RlaW5AbWFpbGJveC5vcmcvCj4gWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2FtbG9naWMvbGludXguZ2l0L2NvbW1pdC8/Cj4gaWQ9NzgyN2RiN2Y2
MTQxZmRhOWFmNGIwNzg2NGNhYjBjMTAzOThhZmZmZgo+IAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
