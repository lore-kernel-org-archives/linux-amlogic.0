Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71299606A31A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JFBxqAab;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FZH/k1ke
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i0IVGRZAS2a/CjZF/0dPy5zpKlYHH35edBAc/WpL/L0=; b=JFBxqAabZJmqY9ShUJgA541aHx
	YBcWzODuKZTeX5gwyFDVSFLqioNYkHNvuHQDjwadjzrGcLAj7hnKbUbLs1MA7yOHsQAqcET0kmmNa
	/6Qm58T7CqcT6nQzuj2vlm4KTSLsrxhVdi0ioPc0AxtwvcVQblKWSsla4xv+yNAVVK1Z3U/3j11xY
	m1i3eqZFeuCRXvtuknDoFqvPVq/cNDH7HyijCykL9OWkN8AUkTcioPaPd3lnG3LfE7Q+TOVMMCkZ9
	uxksBB0HCLI8q/lsV/h5zQBKRJiGDrleoZz2ZdNqptwOUOQIxllduNruzQEm0sil/ZZ76eMMRYqNL
	4rgI55mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGWG-00000001zwI-0wXf;
	Mon, 26 Oct 2026 08:57:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGWD-00000001zvF-0pJJ
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 08:57:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a214af2076so18663915e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793005043; x=1793609843; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=FZH/k1keSJfKvQBTM0KaK0w0iGv05im1wn8ciBgPcQTADJEUMH5fbh1k3f+DILdenR
         9wqPCbCrbrsVKAcspfvwXCP5Nw7ixB8i/1vZcwrAyFPed86P7kISzT+gnOQr6WpH/Agb
         sT7LqYamiD+wfPaxYJ+V6gO/g4MpiChExqCo9TRE6xJ3ronDWOIgmilLNp9thzZmczrH
         QDT9GpNndjXGUUFfgUaX+PJAw7UkTWNGQFb7jhkSsFf33a9xqK9YoGqLtXfFIG0vhMe0
         cQrJF76nKVEHdQuuB4MYmfpg3T9ScRdAHhQNPg1GtrwvI5zrStXlqpNrByevKun1LdVK
         He3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005043; x=1793609843;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI1K7WpjHruW52kJjg4X/MW1X2UQCXM+sxLT9XP/nlQ=;
        b=MeiHwo/GoadlH0W32GC4f+pnUWvazPUq9Tl+15Weg0wJWDVVX1rfgDUp/llKnm1yIB
         nan8yq8LQVEgnh5IKJ5Qx4cnN3yeKIxQw6B74rYMhJtAiJar0DYPKAg1+QFVxyoW4C43
         zMPFf2PNjoYQTJxWg5GYmwAXGd0AXV6ARGB7evtI2D43F/lYv0vaKo2H5//EUEMqY3+H
         aPmZai0W9c4DqQNowiBNKWobGmoMsRFf8k/4zWA51IHhdzV6YB4oHWsz6/ihFiC//X9Y
         MI5bkVgllzrK5JHDh/901989VNS44Gj9xzJVUpmmmYvRpA2QA1PWcfVcjPqhF8K5+Ru1
         AKLA==
X-Forwarded-Encrypted: i=1; AKwUvByvK5pl72oKfDJbNGCeuo5qdIv8pHYS67QTBGHkxPhibTPsrX/a2OPDJsPnukZpnJmX/rvEeXt8jFvq8ZZF@lists.infradead.org
X-Gm-Message-State: AFq9FYK4Z8Uh61JQoDbdtmDW4sAgHTuTNVyMf4jwCQGuGPBl3Px8bmxb
	t3U/unHhJAlwuQ8KMq+vOauT/jBEG6ke2KdsI1ksZ1/yBZBzCn6KpXejQrqivMTGU8c=
X-Gm-Gg: AYBFou1cwMgMe+9l4Yo6W6P6QuuSN6zJcG2L13le7Ln/vobWh9mOgmPXXW+mFXBd5mk
	b3Hf/x7v6PumiP5xYcmiQfJb9X4m7kWByTGdLFVPIQvvf3HR+NpZRaJ0n9ZKRC+pTsPuDJsNGwy
	20zh50R1vtwVtdrax7RIA9mtrSmVhFxm4tSDRrCEAGEZCTQKF/6XIwwuTxMdGH6InQclERFFFU5
	x2PEpo/yFKlmopco94H/+J/hxmwrAqvan1UoChHdBUbfaV74djC6vYxKYi5IfHKsZudpA2MbUJl
	dvKB4wI4mT1NZ+pH3sgrlgSUkQlNT1/27I7uE6UK+EnxeKQMfWg+/CIwxreqefzSem1gw8qiw/O
	LfXbRywKxH+7uewD85Yt6ElVW9OQn8C2dSMbnB6WnpJae97kuWYdYVQGjrjv00WEgBftOdybxRr
	2l/EVxa0b4l6cI+1ue7lTcPWdCGxvqrqLvNHnnJ2EzrCNAACyvHiYfBOSoUey3SeRvhNjYvMXQ5
	jVt8UKE/nDgOPO0tc2hGehphNvsgDvPOWNGhJEdYWWtmgvLCv2xi4e8vNCQJT7vizI/ahdsXbE=
X-Received: by 2002:a05:600c:3b25:b0:4a2:1a:a128 with SMTP id 5b1f17b1804b1-4a35ac9f1ecmr118305925e9.19.1793005043279;
        Mon, 26 Oct 2026 01:57:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d998sm187484365e9.15.2026.10.26.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:57:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4?=
 =?utf-8?B?bA==?=
 <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
In-Reply-To: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
Date: Mon, 26 Oct 2026 09:57:22 +0100
Message-ID: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_015725_276020_58B6D3F5 
X-CRM114-Status: GOOD (  13.44  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gbHVuLiAyNiBvY3QuIDIwMjYgYXQgMTE6MDAsIFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFy
QGxpbmFyby5vcmc+IHdyb3RlOgoKPiBPbiAyNS0xMC0yNiwgMjA6MjIsIGNocmlzdGlhbi5rb2V2
ZXItZHJheGxAc3R1ZGVudC51aWJrLmFjLmF0IHdyb3RlOgo+PiBGcm9tOiBDaHJpc3RpYW4gU3Rl
ZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPj4gCj4+IEV2ZXJ5IFM0IHNw
ZWVkIGJpbiBydW5zIHRoZSBzYW1lIENQVSBmcmVxdWVuY2llcyBidXQgbmVlZHMgaXRzIG93bgo+
PiB2b2x0YWdlIGN1cnZlLCBhbmQgdGhlIGJpbiBjYW4gb25seSBiZSByZWFkIHRocm91Z2ggdGhl
IHNlY3VyZSBtb25pdG9yLgo+PiAKPj4gUmVhZCB0aGUgYmluIGZyb20gdGhlIGZpcm13YXJlLCBz
ZWxlY3QgdGhlIG1hdGNoaW5nCj4+ICJvcHAtbWljcm92b2x0LXNwZWVkPGJpbj4iIHByb3BlcnR5
IGZvciBhbGwgQ1BVcywgdGhlbiByZWdpc3Rlcgo+PiBjcHVmcmVxLWR0LiBCaW5zIG91dHNpZGUg
dGhlIGtub3duIHJhbmdlIGZhbGwgYmFjayB0byBiaW4gMCwgd2hpY2gKPj4gaGFzIHRoZSBoaWdo
ZXN0IHZvbHRhZ2VzLiBMaWtlIHN1bjUwaS1jcHVmcmVxLW52bWVtLCB0aGUgZHJpdmVyIGJpbmRz
Cj4+IG9uIHRoZSBTb0MgY29tcGF0aWJsZSBhbmQgbmVlZHMgbm8gbm9kZSBvZiBpdHMgb3duLCBh
bmQgUzQgaXMgYWRkZWQgdG8KPj4gdGhlIGNwdWZyZXEtZHQtcGxhdGRldiBibG9ja2xpc3Qgc28g
Y3B1ZnJlcS1kdCBpcyBvbmx5IGNyZWF0ZWQgYWZ0ZXIKPj4gdGhlIGJpbiBoYXMgYmVlbiBhcHBs
aWVkLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs
IDxja29ldmVyQG91dGxvb2suZGU+Cj4+IC0tLQo+PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAxICsKPj4gIGRyaXZlcnMvY3B1ZnJlcS9LY29uZmlnLmFybSAgICAg
ICAgICB8ICAxNCArKwo+PiAgZHJpdmVycy9jcHVmcmVxL01ha2VmaWxlICAgICAgICAgICAgIHwg
ICAxICsKPj4gIGRyaXZlcnMvY3B1ZnJlcS9hbWxvZ2ljLWNwdWZyZXEuYyAgICB8IDE4NCArKysr
KysrKysrKysrKysrKysrKysrKysrKysKPj4gIGRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLWR0LXBs
YXRkZXYuYyB8ICAgMiArCj4+ICA1IGZpbGVzIGNoYW5nZWQsIDIwMiBpbnNlcnRpb25zKCspCj4+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jcHVmcmVxL2FtbG9naWMtY3B1ZnJlcS5jCj4K
PiBJcyBpdCBzYWZlIHRvIGFwcGx5IGp1c3QgdGhpcyBvbmUgPyBJIGNhbiB0YWtlIHRoaXMgdmlh
IHRoZSBQTSB0cmVlIHRoZW4uCgpJIHdvdWxkIGFkdmlzZSB0byB3YWl0IGEgbGl0dGxlIGZvciBB
bWxvZ2ljIHRvIGNoaW1lIGluLgoKUGF0Y2ggMiBpcyBzb21ldGhpbmcgSSBhbHJlYWR5IHJlamVj
dGVkIGJhY2sgd2hlbiBTNCBzdXBwb3J0IHdhcwppbml0aWFsbHkgaW50cm9kdWNlZC4gSSBzdXBw
b3NlIEFJIGp1c3QgdW5lYXJ0aGVkIGl0IGFuZCBkaWQgbm90IGJvdGhlcgp0byBtZW50aW9uIGl0
LgoKQW1sb2dpYyB3YXMgc3VwcG9zZWQgdG8gbWlncmF0ZSB0byBTQ01JIGF0IHRoYXQgcG9pbnQs
IGFuZCBwb3NzaWJseQpoYW5kbGUgQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nIHRocm91Z2ggdGhlIHNl
Y3VyZSBmdyBlbnRpcmVseS4KClRoZXkgZGlkIG9uIGxhdGVyIFNvQ3MsIEkgZG9uJ3Qga25vdyB3
aGVyZSB0aGVpciBGVyBzdGFuZHMgb24gdGhlIFM0LgoKPgo+IC0tIAo+IHZpcmVzaAoKLS0gCkpl
cm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
