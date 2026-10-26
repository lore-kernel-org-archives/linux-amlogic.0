Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40F606A32F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VX6lLti5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Aft1cNwV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jt4YMdlDeb2baB9B9mHbHIOQ/vh4JeIVT+pdVnfKHhc=; b=VX6lLti5ZnZSUF3STWkkKARSsN
	Q6r1Mzg8U00+CqZNslj1d7YC2liTctAtkJeRQuQM1xFV3PB674LRyfUZEQUJx9On6mZn307roMDwJ
	evuRkZVxb0adLMkuF/S3CgF7RbiO+sswc6nrkMvGW3Pq2s/DLPTbSvQM7xBfIeqhzv9wPBHw0MATE
	ALVqAx4ThhEmoS7lSIqzuofbOnc3y4dZ2jt95DtqQkXPUzp8LsPt2feljUIy6BA9kvKsFEh1EoCeA
	GC+V1EaTo1/v8N5eCMF6SysLoEVYLTQb8z4+RvZwhEhJbPL29rNxphTqpojrYBYnYzjtYphMedlIW
	8XjrLNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGLd-00000001yry-1Wnq;
	Mon, 26 Oct 2026 08:46:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGLb-00000001yq0-0Iwy
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 08:46:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso27697605e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2026 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793004385; x=1793609185; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=Aft1cNwVWNvT0QdXUnsPs76bDOLZrzNhrtHYC0M8xxdOJunRW9zgzaY4BJGu7iaSIV
         6cHfcJowdmllcb6+vfMh4fdNSrKIh8yE1Q6ARF2B/VEOMDavElf/BiCt1cVpmCSOahtH
         xuGOXysqrMt3qDgaoFgK2mz6U9cBBWJTcg4anSWCTHQgQ6onIDyRwPiY0I3jX0ocsAMm
         DHZlre9q0iVdI0F7fKRMxmZ39JJotza5594TSYd+S4cH79T5ZuHFYVFcrl25N3Qs9Hje
         OsIMvH6WxqHqfNGBXhJbSPIzLvnQpMZrrBI1xSqq7Lu6L6mhztHFZnfxvWboyqoty5X7
         MWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004385; x=1793609185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5I9G++sBFZBEvdUOgC96XBerDJBhmVoXeNlZeIKbjBA=;
        b=gaeYePxScnnrS/yEsR3vllv3NlyhM4cQQvtmBVNDI+npu/E4w3ato20HmUmyNtsEY1
         HOVAJ2wVSg0bbP5qrP6UY0RU04Ne3AhBpA7Mrj2Kksnbn1s2R2pvh9Y3QqVI7LTDBFGn
         8Tr1NB7tTcnWRo05kHG49nTLSBj1iz9cP76eScDLRuPwPvHP89/ta9jg+2nZ0Y64JuGC
         mFIFCxVjauE1OblWVIT4HM96GztBKygbSkYJOAcksvlm+G9dXOt2SLSJJQJ3aaqsmsiq
         Ukb5mKrJnERUrYTrqVS5lySJfp2qMBA4HqdRPFFhGRX2TJO/H6S1//Cj/B3ZbuxgNpeN
         IP+A==
X-Gm-Message-State: AFq9FYKL/6TUPI5ew86rDHZQSxQDMkcSruiCZ7U1u9sp9hK5fkDU3p4w
	fgTbsRJ0pm4se2GH1eqSGVQne6eck5FWQz4/yOQPNWTa2qjIZXzAXkchtRSmr62CjI0=
X-Gm-Gg: AYBFou0jDD4FCKPLyFnocdzjTOZs6KIrftRUIe76/JuGq0diwWD+tiQnSOB9rn8B7uU
	NLN/ICBVLVvCJPE6Q8p6Q38ZQ40Md+yfHbxO2ynvysCIvKtvy1HK/h99A6I412F1/pK2/vwNhiX
	Oc8k2EZgrKa6BMDKVqRtyBpl4T+kOfnxyed/8aDWLA9z1dDQKYnYm/X4RRDUlEJl5OTRY89phlX
	mG8/n1TiMFY8BJiOwyv955/u7rXNwF+t5hIfr5yr4tKVZeP3DrFugytpsUTBcQeIwWH6yLkpgr5
	/mwK9E/4G2ycI9iLo5C9/e4H9DKpMjwWkFhwU+s7NrnfONrJyMWs8XuHVGQkRaiMQDIyx3nmKEb
	GRGZojs04AvaMp5EJARD+Y1ONK0aYY0n1LuzbG4ZU+70IUdXK8ktgB8bsw2icDkdQ0PzFcfJWfh
	dFohd7LrmSJ1j0PIm2kTKI1MF0xEkJFMBT3TJ7UaaZDWg97fGHI6kpMpjNf0zt909IykGmG27kv
	j58uwSZoz96Ta51JPyp5mcntaJ6uZNGuiHBCMuJ5UyWPgwml9RW7IR4cSKwj42Yf7zJYhkFkek=
X-Received: by 2002:a05:600c:6384:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a35ac3acb7mr105232365e9.3.1793004385073;
        Mon, 26 Oct 2026 01:46:25 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm146277845e9.2.2026.10.26.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:46:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
 sboyd@kernel.org, bmasney+clk@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH v7 0/7] Add support for S4 audio
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
Date: Mon, 26 Oct 2026 09:46:21 +0100
Message-ID: <1jik2okfxe.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_014627_129655_60FD04C6 
X-CRM114-Status: GOOD (  21.83  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gZGltLiAyNSBvY3QuIDIwMjYgYXQgMjA6MjMsIGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1
ZGVudC51aWJrLmFjLmF0IHdyb3RlOgoKPiBGcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXIt
RHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPgo+IFRoaXMgcGlja3MgdXAgSmllYmluZyBDaGVu
J3MgIltQQVRDSCB2NiAwLzRdIEFkZCBzdXBwb3J0IGZvciBTNCBhdWRpbyIKPiAoYW5kIHRoZSB0
b2hkbWl0eCBTNCBwYXRjaCkgdW5jaGFuZ2VkIGFwYXJ0IGZyb20gcmViYXNpbmcsIHdpdGgKPiBK
aWViaW5nJ3MgYXV0aG9yc2hpcCBrZXB0LCBhbmQgYWRkcyBvbmUgZml4IG9uIHRvcDoKPgo+ICA2
OiBnMTJhLXRvYWNvZGVjOiBmaXggdGhlIFM0IHNvdXJjZSBtdXggcmVhZC1iYWNrLiBUaGUgUzQg
REFUX1NFTAo+ICAgICBmaWVsZCBtb3ZlZCwgc28gdGhlIG11eCBhbHdheXMgcmVhZCBiYWNrIGFz
IGlucHV0IEEgYW5kIERBUE0gbmV2ZXIKPiAgICAgcG93ZXJlZCB0aGUgc2VsZWN0ZWQgcGF0aC4K
PgoKSmllYmluZyBoYXMgcG9zdGVkIGEgdjcgYWxyZWFkeS4KClVzaW5nIEFJIGlzIGNlcnRhaW5s
eSBuaWNlIGJ1dCBJIHdvdWxkIGFkdmlzZSB0aGF0IHlvdSBzbG93IGRvd24gYQpsaXR0bGUgYW5k
IGdldCB1c2VkIHRvIHdvcmtpbmcgd2l0aCB0aGUgbWFpbmxpbmcgYmVmb3JlIHNlbmRpbmcgNyBz
ZXJpZXMKaW4gYSBtYXR0ZXIgb2YgaG91cnMuCgo+IFtja29ldmVyOiBKaWViaW5nLCBpZiB5b3Ug
aGF2ZSBhIG5ld2VyIHZlcnNpb24gb3IgcHJlZmVyIHRvIHBvc3QgdGhpcwo+IHlvdXJzZWxmLCBJ
IGFtIGhhcHB5IHRvIHJlYmFzZSB0aGUgZml4IG9udG8gdGhhdCBpbnN0ZWFkLl0KPgoKRm9yIGV4
YW1wbGUsIGluc3RlYWQgb2YgdGhpcyB5b3UgY291bGQgaGF2ZSB0cmllZCB0byBwaW5nIGhpbSBw
cml2YXRlbHkKYmVmb3JlIHRyeWluZyB0byB0YWtlb3ZlciBmcm9tIGhpbS4gSGUgd291bGQgcHJv
YmFibHkgaGF2ZSB0b2xkIHlvdQp0aGF0IGhlIGhhcyBhbHJlYWR5IHNlbnQgYSB2NyBhbmQgKEkg
c3VwcG9zZSkgaXMgd29ya2luZyBvbiB2OC4KClNvIHBsZWFzZSBiZSBwYXRpZW50LgoKPiBUZXN0
ZWQ6IEhETUkgYXVkaW8gdXAgdG8gMTkyIGtIejsgdGhlIFRETS1DIHRvIGludGVybmFsIGNvZGVj
IHBhdGgKPiBwbGF5cyB3aXRob3V0IGVycm9ycyBhdCA0NC4xIHRvIDE5MiBrSHogKG5vdCBsaXN0
ZW5lZCB0bykuCj4KPiBUb29sIHVzZSAoRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2dlbmVyYXRlZC1j
b250ZW50LnJzdCk6Cj4gVGhpcyB3b3JrIHdhcyBkb25lIHdpdGggdGhlIGhlbHAgb2YgYW4gQUkg
Y29kaW5nIGFzc2lzdGFudCwgQ2xhdWRlCj4gKEFudGhyb3BpYyksIHVzZWQgdGhyb3VnaCBDbGF1
ZGUgQ29kZSBvdmVyIG1hbnkgc2Vzc2lvbnMuIEl0IGRpZCBhIGxhcmdlCj4gcGFydCBvZiB0aGUg
aGFuZHMtb24gd29yazogaXQgcmVhZCB0aGUgdmVuZG9yIGtlcm5lbCBhbmQgdGhlIGZpcm13YXJl
Cj4gaW50ZXJmYWNlcywgcHJvYmVkIHJlZ2lzdGVycyBvbiB0aGUgYm9hcmQsIGRyYWZ0ZWQgdGhl
IGNvZGUgYW5kIHRoZQo+IGNoYW5nZWxvZ3MsIGFuZCByYW4gdGhlIGJ1aWxkcywgY2hlY2twYXRj
aCwgZHRfYmluZGluZ19jaGVjayBhbmQgdGhlCj4gdGVzdHMgb24gdGhlIGhhcmR3YXJlLiBJIGRp
cmVjdGVkIHRoZSB3b3JrLCByZXZpZXdlZCBldmVyeSBjaGFuZ2UgYW5kCj4gdGhlIGZpbmFsIHBh
dGNoZXMsIGFuZCB0YWtlIHJlc3BvbnNpYmlsaXR5IGZvciB0aGVtLiBUaGVyZSBpcyBubyBzaW5n
bGUKPiBwcm9tcHQgdG8gcXVvdGU7IHRoZSBzZXNzaW9ucyB3ZXJlIG9mIHRoZSBmb3JtICJmaW5k
IG91dCB3aHkgWCBmYWlscyBvbgo+IHRoaXMgYm9hcmQsIGZpeCBpdCwgdGVzdCBpdCBvbiB0aGUg
Ym94Ii4KPgo+IFRlc3RlZCBvbiBhbiBBbWVkaWF0ZWNoIFg5OFEgVFYgYm94IChBbWxvZ2ljIFM5
MDVXMiwgUzQgZmFtaWx5LCAyIEdpQiksCj4gdmVuZG9yIFUtQm9vdCBhbmQgQkwzMS9PUC1URUUs
IExpbnV4IDcuMyBwbHVzIHRoaXMgd29yay4KPgo+IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1E
cmF4bCAoMSk6Cj4gICBBU29DOiBtZXNvbjogZzEyYS10b2Fjb2RlYzogZml4IHRoZSBTNCBzb3Vy
Y2UgbXV4IHJlYWQtYmFjawo+Cj4gSmllYmluZyBDaGVuICg2KToKPiAgIGR0LWJpbmRpbmdzOiBj
bG9jazogbWVzb246IEFkZCBhdWRpbyBwb3dlciBkb21haW4gZm9yIFM0IHNvYwo+ICAgZHQtYmlu
ZGluZ3M6IEFzb2M6IGF4Zy1hdWRpbzogQWRkIFM0IGF1ZGlvIHRvY29kZWMKPiAgIEFTb0M6IG1l
c29uOiBnMTJhLXRvYWNvZGVjOiBBZGQgUzQgdG9jb2RlYyBkcml2ZXIKPiAgIGNsazogbWVzb246
IGF4Z19hdWRpbzogYWRkIFM0IHN1cHBvcnQKPiAgIEFTb0M6IGR0LWJpbmRpbmdzOiBhbWxvZ2lj
LGcxMmEtdG9oZG1pdHg6IGFkZCBTNCBjb21wYXRpYmxlCj4gICBBU29DOiBtZXNvbjogZzEyYS10
b2hkbWl0eDogYWRkIFM0IHN1cHBvcnQKPgo+ICAuLi4vY2xvY2svYW1sb2dpYyxheGctYXVkaW8t
Y2xrYy55YW1sICAgICAgICAgfCAgMTggKy0KPiAgLi4uL2JpbmRpbmdzL3NvdW5kL2FtbG9naWMs
ZzEyYS10b2Fjb2RlYy55YW1sIHwgICAxICsKPiAgLi4uL2JpbmRpbmdzL3NvdW5kL2FtbG9naWMs
ZzEyYS10b2hkbWl0eC55YW1sIHwgICAxICsKPiAgZHJpdmVycy9jbGsvbWVzb24vYXhnLWF1ZGlv
LmMgICAgICAgICAgICAgICAgIHwgMTY1ICsrKysrKysrKysrKysrKysrKwo+ICBzb3VuZC9zb2Mv
bWVzb24vZzEyYS10b2Fjb2RlYy5jICAgICAgICAgICAgICAgfCAgNTEgKysrKysrCj4gIHNvdW5k
L3NvYy9tZXNvbi9nMTJhLXRvaGRtaXR4LmMgICAgICAgICAgICAgICB8ICA4MCArKysrKysrKy0K
PiAgNiBmaWxlcyBjaGFuZ2VkLCAzMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+
Cj4gYmFzZS1jb21taXQ6IDdiZTRiYzUyZmQ5ZTBlNTVkYzlhMmUwMjMyYjg5NDI3ZDJjNGI2MTQK
PiAtLSAKPiAyLjU2LjAKPgoKLS0gCkplcm9tZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
