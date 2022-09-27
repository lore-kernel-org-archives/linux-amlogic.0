Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAD9C6FA83
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Sep 2022 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6wESTpcht6x+MQ8LfRqHRP+IWWyTJCQedMsHJxORZQ=; b=qVoXI52Btct1gO
	l1Ev94YiMiAFxnfhik35UDxy3siL8DuZUrloLl8oDuMrjTdvEzSEzNPLzRG0bDgCeNP5+OjWcCQLY
	yZhWerPrt1jP81LqO/puJvWK7oKbpo3vq/b1Gmrqa+4UEV0EO5lPywPnXdL4PXg6VeyhBAZ6bth9w
	noJJZSHhZFFvFFLh1pqsO01TZb5D9A7VzUzxPvI2yVzFCATH5cKYvJumhPY1YFGJDaiuFrjXgm4mZ
	fa3ReZds2bVJAyTBg9mKAAD+VKEI982D0/Fs4Wf6eLUy9q0oVOCAzy5+w6S3MdutdCdmpDbroSRzM
	f+yIDJ4yRsqai1zRAwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od70X-009aui-ME; Tue, 27 Sep 2022 09:36:05 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od70C-009anp-Uk
	for linux-amlogic@lists.infradead.org; Tue, 27 Sep 2022 09:35:46 +0000
Received: by mail-wr1-x429.google.com with SMTP id z6so14105286wrq.1
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Sep 2022 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bYDduPOYUHGL+haj1p8TyQkIszmepMQqlkeaZAG58xQ=;
        b=pqxCY9Jcv96qIg0b1ZjiLbxmNwVLM6AKPHt/eLZ4X/++56Du72O4kXt2u4iJ//B8Kw
         rE9ypTLDUKI4bioBu0TYYob4rbd4ztUedOfjpc2CbDQlcGKzIRy+8q45jzxPI5MKiIL9
         /Pw9DBKJhJeEW5W6iPOiSj8+ZzHVbRiRRuYwtOkPFs7pUH7d00/POKAfoW6eyTovU1pM
         JGrxLHCmstOb+yqRFsgSMh0NXDddRqGfZ2iqJ0jYHQLbrYImFfVTxKRYu5QRDzoTKhiA
         uWC/d8tBim6PMeCRRF4WuW4Nu/lmzmRh1r3+bDxQhdGyR1xh2XXMtPrM0al/e232KRfD
         H+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bYDduPOYUHGL+haj1p8TyQkIszmepMQqlkeaZAG58xQ=;
        b=BRsTqZGduG6ZXR7lZN7Ha4ljFsQGcfm92N8QAWE42EEIqaWYRqH4Ajnl6PHZfPsoLF
         1OtDaKUxrUUTfKAcuuMLPqS3/hNWenhaE6hAI54npvbvO0fNxem2x3IbpVLa1KQZTtP5
         xe2Jlh0S6Mdym4ffjs7XIw0fwVxPbMlfgjoAfWVYwDRWejQmLSVBhbOe3oouCER93uGT
         lTQei0P/iganIMQ79SNHmbxhJZAsgtw5uU4aLak5Qyc2bVvIzzET/2fWcDiBA6H5BvFo
         SpA68ysDI2i3ZRLcGM+BinQVkgrfS7hoFB4diAXRcZKlgSFy7+aXq1bWZg36XztYrif9
         JVZQ==
X-Gm-Message-State: ACrzQf2P0bjdYoiXEc3cae2uQsBZHF79ttOxFKwpoPz0NDn2C3pqCQG0
	Qrwho2HimNjPjZqE2NN19F8I0w==
X-Google-Smtp-Source: AMsMyM5hLEsgw/sMl4xl47SSdL796TJP4p8NX1zAeCjjbSox0gvaWDZaX7FcMrbeGpH36FlEmAJwSQ==
X-Received: by 2002:a5d:5887:0:b0:22b:107e:7e39 with SMTP id n7-20020a5d5887000000b0022b107e7e39mr16606742wrf.694.1664271342352;
        Tue, 27 Sep 2022 02:35:42 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c461100b003a5fa79007fsm1181762wmo.7.2022.09.27.02.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 02:35:41 -0700 (PDT)
Message-ID: <b37e9ada-79d9-685f-7b74-06f0d32ba271@baylibre.com>
Date: Tue, 27 Sep 2022 11:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: neil.armstrong@linaro.org, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 narmstrong@baylibre.com, Da Xue <da@libre.computer>
References: <20220809172017.215412-1-aouledameur@baylibre.com>
 <20220809172017.215412-2-aouledameur@baylibre.com>
 <f9bf3f7e-e949-3e77-a74c-74c0eecd77c0@linaro.org>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <f9bf3f7e-e949-3e77-a74c-74c0eecd77c0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_023545_003681_DDEAC962 
X-CRM114-Status: GOOD (  12.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTmVpbAoKT24gOS8yNy8yMiAxMDoyOSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGksCj4K
PiBPbiAwOS8wOC8yMDIyIDE5OjIwLCBBbWphZCBPdWxlZC1BbWV1ciB3cm90ZToKPj4gU1BJIHBp
bnMgb2YgdGhlIFNQSUNDIENvbnRyb2xsZXIgaW4gTWVzb24tR1ggbmVlZHMgdG8gYmUgY29udHJv
bGxlZCBieQo+PiBwaW4gYmlhaXMgd2hlbiBpZGxlLiBUaGVyZWZvcmUgZGVmaW5lIHRocmVlIHBp
bmN0cmwgbmFtZXM6Cj4+IC0gZGVmYXVsdDogU1BJIHBpbnMgYXJlIGNvbnRyb2xsZWQgYnkgc3Bp
IGZ1bmN0aW9uLgo+PiAtIGlkbGUtaGlnaDogU0NMSyBwaW4gaXMgcHVsbGVkLXVwLCBidXQgTU9T
SS9NSVNPIGFyZSBzdGlsbCBjb250cm9sbGVkCj4+IGJ5IHNwaSBmdW5jdGlvbi4KPj4gLSBpZGxl
LWxvdzogU0NMSyBwaW4gaXMgcHVsbGVkLWRvd24sIGJ1dCBNT1NJL01JU08gYXJlIHN0aWxsIGNv
bnRyb2xsZWQKPj4gYnkgc3BpIGZ1bmN0aW9uLgo+Pgo+PiBSZXBvcnRlZC1ieTogRGEgWHVlIDxk
YUBsaWJyZS5jb21wdXRlcj4KPj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1z
dHJvbmdAYmF5bGlicmUuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBBbWphZCBPdWxlZC1BbWV1ciA8
YW91bGVkYW1ldXJAYmF5bGlicmUuY29tPgo+Cj4gRG9uJ3QgZm9yZ2V0IHRvIENDIGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnIG90aGVyd2lzZSBpdCB3b24ndCBiZSAKPiByZXZpZXdlZC4KClN1
cmUsIHdpbGwgZG8gaW4gVjIuCgpSZWdhcmRzLAoKQW1qYWQKCj4KPgo+PiAtLS0KPj4gwqAgLi4u
L2JpbmRpbmdzL3NwaS9hbWxvZ2ljLG1lc29uLWd4LXNwaWNjLnlhbWzCoMKgwqDCoMKgIHwgMTUg
KysrKysrKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgCj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nw
aS9hbWxvZ2ljLG1lc29uLWd4LXNwaWNjLnlhbWwgCj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NwaS9hbWxvZ2ljLG1lc29uLWd4LXNwaWNjLnlhbWwKPj4gaW5kZXggNTBk
ZTBkYTQyYzEzLi4xMDcwN2E4MjE2ZjUgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zcGkvYW1sb2dpYyxtZXNvbi1neC1zcGljYy55YW1sCj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvYW1sb2dpYyxtZXNvbi1neC1z
cGljYy55YW1sCj4+IEBAIC00Myw2ICs0MywxNCBAQCBwcm9wZXJ0aWVzOgo+PiDCoMKgwqDCoMKg
IG1pbkl0ZW1zOiAxCj4+IMKgwqDCoMKgwqAgbWF4SXRlbXM6IDIKPj4gwqAgK8KgIHBpbmN0cmwt
MDoKPj4gK8KgwqDCoCBtaW5JdGVtczogMQo+PiArCj4+ICvCoCBwaW5jdHJsLTE6Cj4+ICvCoMKg
wqAgbWF4SXRlbXM6IDEKPj4gKwo+PiArwqAgcGluY3RybC1uYW1lczogdHJ1ZQo+PiArCj4+IMKg
IGlmOgo+PiDCoMKgwqAgcHJvcGVydGllczoKPj4gwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+PiBA
QCAtNjksNiArNzcsMTMgQEAgZWxzZToKPj4gwqDCoMKgwqDCoMKgwqAgaXRlbXM6Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBjb3JlCj4+IMKgICvCoMKgwqAgcGluY3RybC1uYW1lczoK
Pj4gK8KgwqDCoMKgwqAgbWluSXRlbXM6IDEKPj4gK8KgwqDCoMKgwqAgaXRlbXM6Cj4+ICvCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBkZWZhdWx0Cj4+ICvCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBp
ZGxlLWhpZ2gKPj4gK8KgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGlkbGUtbG93Cj4+ICsKPj4gwqAg
cmVxdWlyZWQ6Cj4+IMKgwqDCoCAtIGNvbXBhdGlibGUKPj4gwqDCoMKgIC0gcmVnCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
