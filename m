Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B6CC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 10:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vKHwXQRhla/RFDeQee66veLb2j4kYgfEA22PNktyvE=; b=BQorAnS8W7yOGObzNg4nyIYE98
	VRTRt+1Qedb3fW5XB1LwWM+hcqQCAuzHy4fNNSD5hHzTv8ejGA2Unfu1PQHxMD5S/UBKRAoqYhmWx
	M9Im5iR4yxCbno2vNSWfhVC1kHCkiqfv5NXDTuld02adfDhbHnHZg2JmUC5gJkj7WWf8CAiNn+uRq
	qlAaEz4hvBls2g3XVJRpDaYqeUgm5N7guYR5EhgpdadUpex6W0BhKatB7Yz55E274AVEQe4V7Egt6
	hgJAaxWlyxUHnt/b7uZ9Y0eJ08GnUTx+ahNYpayNLBCU1n3vKAPNU+Pi4HY41yj71VC+d9qxnIwD5
	vrbdd+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7f9-00CCO6-9S; Mon, 06 Mar 2023 10:01:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ7f7-00CCN4-1j
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 10:01:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h11so8161375wrm.5
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 02:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678096901;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DKUhkh79uPZf/c1Q+O8gsggZDnjUJ79Daaxmw6f4uOg=;
        b=iZe+iOGrrznTOGSyBSvUTc2uF4RD5pQBuPdKGV1LL5ZNC7Zr8IolZzIOB9d7uIudjv
         NEoiR09QUXkO3xZ5YK8mVFy7qHYKkxxjfGvAg37A/nqf1Cpit4NJEh3E9tNh8ZYbIBtx
         MM5N/Gq/VsrzGk93XaSxcGFCnM5IXxQuKdsl8Qs/ljKS0bOLoe2p3FknFh26FszhvIfw
         5J+DjGTgvtjNnGdrTxknZ44CJxGCUap1Uc/np75uIst7MECAYC3gDG4qXPfO66TEgHhF
         Rh5LDxilkgJmu2AnHaEEbos5GEzBscYgPe6jvTCiHCDKdVhITvoGS0DJLs0EeQyz7N3J
         WmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678096901;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKUhkh79uPZf/c1Q+O8gsggZDnjUJ79Daaxmw6f4uOg=;
        b=qLNTCI+UMFo79qJw8F2niha/2HSI1C4F5QJekK9zscTZnBhdpj7wAdNk50+3SHNpbO
         0GinBLO8KdwtngxNiOrFtlR+7Cnxv/aiUiVKptu8YN6O3+UHLyIOLaWeRDpfFijJdFsU
         tLiLAtlUdgFMnZ7Ejoo7MhmlAuD3V2DfOimvMLecGCtFnZyo+faUWUrdmGjcMPJCwqJc
         CArLXQMilkC5f1XA0vfJKUiW4o8PyUYiqTgvUHpJroqg5SrVaqY2+GieKUGM+QfzU4gC
         huw9PVdybh3yhuAY4zCctK3agGDeHj8jbNYNd0gjFlITpn3cYdzW/58IJKVwvu2Og8SB
         YVeQ==
X-Gm-Message-State: AO0yUKUyof3jotHD3uoyS2rxkeda9qFCLNN2x/ap5nKGcfqSwEsO2weQ
	BjqjIsMzIG4E3+4AeteubOaoZ2qA9dO1D6+1sSNYLw==
X-Google-Smtp-Source: AK7set83MnqsW13MZyd5LcprOdnUUllu++gGT1/mxpzauQO++cD0Ng2NVHGIp+V7c6FJYnSUdbo5TQ==
X-Received: by 2002:a05:6000:10c9:b0:2c7:1c08:1224 with SMTP id b9-20020a05600010c900b002c71c081224mr6540988wrx.29.1678096901361;
        Mon, 06 Mar 2023 02:01:41 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id x17-20020adfdcd1000000b002c5804b6afasm9596541wrm.67.2023.03.06.02.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:01:41 -0800 (PST)
Message-ID: <ec4932f7-c279-2787-7712-4b7d60a64223@linaro.org>
Date: Mon, 6 Mar 2023 11:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Mainline kernel 6.0+ hangs on S905D3
Content-Language: en-US
To: Oleksii Fedorov <vsnrain@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <3EC0EBE6-208A-424D-98FE-BAC8B8707519@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <3EC0EBE6-208A-424D-98FE-BAC8B8707519@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_020145_155237_96F6A568 
X-CRM114-Status: GOOD (  14.01  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAwNi8wMy8yMDIzIDEwOjM1LCBPbGVrc2lpIEZlZG9yb3Ygd3JvdGU6Cj4gSGVsbG8u
Cj4KPiBJIGFtIHNvcnJ5IGZvciBtYXliZSBhIHN0dXBpZCBxdWVzdGlvbiwgYnV0IEkgYW0gaGF2
aW5nIGlzc3VlcyBydW5uaW5nIG1haW5saW5lIGtlcm5lbCBvbiBBbWxvZ2ljIFM5MDVEMyAoS2hh
ZGFzIFZJTTNMIGJvYXJkKS4KPiBJdCBjb21wbGV0ZWx5IGhhbmdzIGFyb3VuZAo+Cj4gWyDCoCDC
oDIuMzc2NzUyXSBtZXNvbi1neC1tbWMgZmZlMDMwMDAuc2Q6IGFsbG9jYXRlZCBtbWMtcHdyc2Vx
Cj4gWyDCoCDCoDIuMzc4NjQ1XSBtZXNvbi1neC1tbWMgZmZlMDcwMDAubW1jOiBhbGxvY2F0ZWQg
bW1jLXB3cnNlcQo+IFsgwqAgwqAyLjM4NDEyNV0gc2ltcGxlLWZyYW1lYnVmZmVyIDdmZTViMDAw
LmZyYW1lYnVmZmVyOiBmcmFtZWJ1ZmZlciBhdCAweDdmZTViMDAwLCAweDE5NTAwMCBieXRlcwo+
IFsgwqAgwqAyLjM5MTQxN10gc2ltcGxlLWZyYW1lYnVmZmVyIDdmZTViMDAwLmZyYW1lYnVmZmVy
OiBmb3JtYXQ9eDhyOGc4YjgsIG1vZGU9NzIweDU3NngzMiwgbGluZWxlbmd0aD0yODgwCj4gWyDC
oCDCoDIuNDAxODkzXSBDb25zb2xlOiBzd2l0Y2hpbmcgdG8gY29sb3VyIGZyYW1lIGJ1ZmZlciBk
ZXZpY2UgOTB4MzYKPiBbIMKgIMKgMi40MDY3NjNdIHNpbXBsZS1mcmFtZWJ1ZmZlciA3ZmU1YjAw
MC5mcmFtZWJ1ZmZlcjogZmIwOiBzaW1wbGVmYiByZWdpc3RlcmVkIQo+Cj4gSWYgdGhlcmUgaXMg
bm8gSERNSSBkaXNwbGF5IGF0dGFjaGVkLCBsYXN0IDQgbGluZXMgZG8gbm90IGFwcGVhciBhbmQg
aXQgaGFuZ3MgYXQKPgo+IFsgwqAgwqAyLjM3ODY0NV0gbWVzb24tZ3gtbW1jIGZmZTA3MDAwLm1t
YzogYWxsb2NhdGVkIG1tYy1wd3JzZXEKPgo+IEkgd2lsbCBhbHNvIHB1dCB0aGUgZnVsbCBib290
IGxvZyB0byBhdHRhY2htZW50Lgo+IEtlcm5lbHMgd2l0aCBhbWxvZ2ljIHNwZWNpZmljIHBhdGNo
ZXMgc2VlbXMgdG8gd29yayBmaW5lLCBsaWtlIG1hbmphcm8gbGludXgtYW1sWzFdIG9ywqBsaW51
eC1hYXJjaDY0LWZsaXBweVsyXQo+Cj4gRG8geW91IGtub3cgd2hhdCBtaWdodCBiZSB0aGUgaXNz
dWUsIG9yIHdoYXQgZXhhY3QgcGF0Y2ggZml4ZXMgaXQ/IElzIHRoZXJlIGFueSBwbGFucyBvZiBt
b3ZpbmcgaXQgdG8gbWFpbmxpbmU/CgoKSSBkb24ndCBrbm93IHRoaXMgaXNzdWUgYXQgYWxsLCB0
aGFua3MuCgoKSXMgdGhpcyB0aGUgc2FtZSB3aXRoIHY2LjMtcmMxID8gZG93bmdyYWRpbmcgdS1i
b290IGNoYW5nZXMgc29tZXRoaW5nID8KCgpOZWlsCgoKPgo+IEJlc3QgcmVnYXJkcywKPgo+IFsx
XSBodHRwczovL2dpdGxhYi5tYW5qYXJvLm9yZy9tYW5qYXJvLWFybS9wYWNrYWdlcy9jb3JlL2xp
bnV4LWFtbAo+IFsyXSBodHRwczovL2F1ci5hcmNobGludXgub3JnL3BhY2thZ2VzL2xpbnV4LWFh
cmNoNjQtZmxpcHB5Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
